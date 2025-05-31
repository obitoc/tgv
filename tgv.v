
module tgv
import net.http
import x.json2
import json
pub fn new(token string) Bot {
	return Bot {
		url: "https://api.telegram.org/bot$token"
	}
}

fn convert_to_json(data string) !json2.Any {
	return json2.raw_decode(data)!
}


pub fn (mut bot Bot) on(handler fn(MessageContext)){
	bot.msg_handlers << handler
}
fn (bot Bot) handle_update(update json2.Any,speedup bool){
	data := json.decode(MessageContext,update.str()) or {return}
	for handler in bot.msg_handlers{
		if speedup{go handler(data)} else {handler(data)}
	}
}
pub fn (bot Bot) get_updates(offset int) ![]json2.Any {

	idk := http.get(bot.url + "/getUpdates?offset=${offset}"	)!
	body_json := convert_to_json(idk.body) or {
		return []
	}
	ok := body_json.as_map()["ok"]!

	if ok.bool(){
		res := body_json.as_map()["result"]!.arr()
		return res
	} else {
		return []
	}
}
pub fn (bot Bot) polling(is_goroutine bool) ! {
	mut offset := 0
	for {
		getupd := bot.get_updates(offset) or {continue}
		if getupd.len == 0 {
			continue
		}
		for update in getupd{
			bot.handle_update(update,is_goroutine)

		}
		last_update := getupd[getupd.len - 1]
		offset = last_update.as_map()["update_id"]!.int() + 1
	}
}
pub fn (bot Bot) get_me() !json2.Any {
	idk := http.get(bot.url + "/getMe")!
	return convert_to_json(idk.body)
}

