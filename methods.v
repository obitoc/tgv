module tgv
import x.json2
import net.http
// SendChatAction
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
// DeleteMessage
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
// SendMessage
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
// SendLocation
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
// SendContact
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
// Not Tested Yet If something Went Wrong Send To Us
// Opts takes Array of Reaction
// Reaction has to field type - emoji
// is_big for animtion i guess
// See Telegram Docs
pub fn (bot Bot) set_message_reaction(chat_id string,message_id string,optss map[string]string) !json2.Any {
	mut form := {
		"chat_id":chat_id,
		"message_id":message_id
	}
	for key,value in optss {
		form[key] = value
	}
	opts := json2.encode(form)
	idk := http.post_json(
		bot.url + "/setMessageReaction",
		opts,
		)!

	return convert_to_json(idk.body)
}
