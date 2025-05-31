
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
pub fn (mut bot Bot) on(handler fn(MessageContext,string)){
	bot.msg_handlers << handler
}
fn (bot Bot) handle_update(update json2.Any,speedup bool){
	mut typeo := ""
	data := json.decode(MessageContext,update.str()) or {return}
	if data.message.date != 0{
		typeo += "message"
	} else if data.edited_message.date != 0{
		typeo += "edited_message"
	} else if data.edited_business_message.date != 0{

		typeo += "edited_business_message"
	} else if data.channel_post.date != 0{

		typeo += "channel_post"
	} else if data.edited_channel_post.date != 0{

		typeo += "edited_channel_post"
	} else if data.business_message.date != 0{

		typeo += "business_message"
	}
	println(typeo)
	for handler in bot.msg_handlers{
		if speedup{go handler(data,typeo)} else {handler(data,typeo)}
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

