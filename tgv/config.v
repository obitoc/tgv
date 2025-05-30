module tgv
pub struct PhotoSize{
	pub:
		file_id string @[json:"file_id"]
		file_unique_id string @[json:"file_unique_id"]
		width i16 @[json:"width"]
		height i16 @[json:"height"]
}
pub struct Chat{
	pub:
		id i64 @[json:"id"]
		first_name string @[json:"first_name"]
		username string @[json:"username"]
		title string @[json:"title";default:""]
		last_name string @[json:"last_name";default:""]
		typee string @[json:"type"]
}

pub struct From{
	pub:
		id i64 @[json:"id"]
		is_bot bool @[json:"is_bot"]
		last_name string @[json:"last_name";default:""]

		first_name string @[json:"first_name"]
		username string @[json:"username"]
}
pub struct Message {
	pub:
		from From @[json:"from"]
		chat Chat @[json:"chat"]
		message_id i64 @[json:"message_id"]
		date i64 @[json:"date"]
		text string @[json:"text";default:""]
}
pub struct MessageContext{
	pub:
		update_id i64 @[json:"update_id"]
		message Message @[json:"message"]

}
pub struct Bot {
	pub:
		url string
	mut:
		msg_handlers []fn(MessageContext)

}
