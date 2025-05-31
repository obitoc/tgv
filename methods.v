module tgv
import x.json2
import net.http

pub fn (bot Bot) send_chat_action(chat_id string,chat_action string) !json2.Any {


	mut form := {
		"chat_id":chat_id,
		"action":chat_action,
	}

	opts := json2.encode(form)
	idk := http.post_json(
		bot.url + "/sendChatAction",
		opts,
		)!

	return convert_to_json(idk.body)
}
pub fn (bot Bot) delete_message(chat_id string,message_id string) !json2.Any {


	mut form := {
		"chat_id":chat_id,
		"message_id":message_id,
	}

	opts := json2.encode(form)
	idk := http.post_json(
		bot.url + "/deleteMessage",
		opts,
		)!

	return convert_to_json(idk.body)
}
pub fn (bot Bot) send_message(chat_id string,message string,optss map[string]string) !json2.Any {


	mut form := {
		"chat_id":chat_id,
		"text":message,
	}
	for key,value in optss {
		form[key] = value
	}

	opts := json2.encode(form)
	idk := http.post_json(
		bot.url + "/sendMessage",
		opts,
		)!

	return convert_to_json(idk.body)
}
pub fn (bot Bot) send_location(chat_id string,long string,latu string,optss map[string]string) !json2.Any {

	mut form := {
		"chat_id":chat_id,
		"longitude":long,
		"latitude":latu,
	}
	for key,value in optss {
		form[key] = value
	}

	opts := json2.encode(form)
	idk := http.post_json(
		bot.url + "/sendLocation",
		opts,
		)!

	return convert_to_json(idk.body)

}

pub fn (bot Bot) send_contact(chat_id string,phone string,first_name string,optss map[string]string) !json2.Any {
	mut form := {
		"chat_id":chat_id,
		"phone_number":phone,
		"first_name":first_name
	}
	for key,value in optss {
		form[key] = value
	}
	opts := json2.encode(form)
	idk := http.post_json(
		bot.url + "/sendContact",
		opts,
		)!

	return convert_to_json(idk.body)
}

