module tgv
pub struct Entities{
	pub:
		offset int @[json:"offset"]
		length int @[json:"length"]
		typ string @[json:"type"]
}
pub struct Location {
	pub:
		latitude	f64 @[json:"latitude"]
		longitude	f64 @[json:"longitude"]
		horizontal_accuracy	f64 @[json:"horizonral_accuracy"]
		live_period int	@[json:"live_period"]
		heading	int @[json:"heading"]
		proximity_alert_radius int @[json:"proximity_alert_radius"]

}
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

pub struct User{
	pub:
		id i64 @[json:"id"]
		is_bot bool @[json:"is_bot"]
		last_name string @[json:"last_name";default:""]

		first_name string @[json:"first_name"]
		username string @[json:"username"]
}
pub struct Message {
	pub:
		from User @[json:"from"]
		chat Chat @[json:"chat"]
		message_id i64 @[json:"message_id"]
		date i64 @[json:"date"]
		photo []PhotoSize @[json:"photo";default:""]
		entities []Entities @[json:"entities"]
		text string @[json:"text";default:""]
}
pub struct ReactionType {
	typeo string @[json:"type"]
	emoji string @[json:"emoji"]
}
pub struct ReactionCount {
	pub:
		typeo	ReactionType @[json:"type"]
		total_count	int @[json:"total_count"]
}
pub struct ShippingAddress {
	pub:
		country_code string @[json:"country_code"]
		state string @[json:"state"]
		city string @[json:"city"]
		street_line1 string @[json:"street_line1"]
		street_line2 string @[json:"street_line2"]
		post_code string @[json:"post_code"]
}
pub struct MessageReactionUpdate {
	pub:
		chat Chat @[json:"chat"]
		message_id int @[json:"message_id"]
		user User @[json:"user"]
		actor_chat Chat @[json:"actor_chat"]
		date i64 @[json:"date"]
		old_reaction []ReactionType @[json:"old_reaction"]
		new_reaction []ReactionType @[json:"new_reaction"]
}
pub struct ChosenInlineResult {
	pub:
		result_id string @[json:"result_id"]
		from User @[json:"from"]
		location Location @[json:"location"]
		inline_message_id string @[json:"inline_message_id"]
		query string @[json:"query"]
}
pub struct OrderInfo {
	pub:
		name string @[json:"name"]
		phone_number string @[json:"phone_number"]
		email string @[json:"email"]
		shipping_address ShippingAddress @[json:"shipping_address"]
}
pub struct InlineQuery {
	pub:
		id string @[json:"id"]
		from User @[json:"from"]
		query string @[json:"query"]
		offset string @[json:"offset"]
		chat_type string @[json:"chat_type"]
		location Location @[json:"location"]
}
pub struct CallBackQuery {
	pub:
		id string @[json:"id"]
		from User @[json:"from"]
		message Message	@[json:"message"]
		inline_message_id string @[json:"inline_message_id"]
		chat_instance string @[json:"chat_instance"]
		data string @[json:"date"]
		game_short_name string @[json:"game_short_name"]
}
pub struct ShippingQuery {
	pub:
		id string @[json:"id"]
		from User @[json:"from"]
		invoice_payload string @[json:"invoice_payload"]
		shipping_address ShippingAddress @[json:"shipping_address"]
}
pub struct PreCheckoutQuery {
	pub:
		id string @[json:"id"]
		from User @[json:"from"]
		currency string	@[json:"currency"]
		total_amount int @[json:"total_amount"]
		invoice_payload	string @[json:"invoice_payload"]
		shipping_option_id string @[json:"shipping_option_id"]
		order_info	OrderInfo @[json:"order_info"]
}
pub struct PaidMediaPurchased {
	pub:
		from User @[json:"from"]
		paid_media_payload string @[json:"paid_media_payload"]
}
pub struct BusinessMessagesDeleted {
	pub:
		business_connection_id string @[json:"business_connection_id"]
		chat Chat @[json:"chat"]
		message_ids	[]int @[json:"message_ids"]
}
pub struct MessageReactionCountUpdate {
	pub:
		chat Chat @[json:"chat"]
		message_id int @[json:"message_id"]
		date i64 @[json:"date"]
		reaction []ReactionCount @[json:"reaction"]
}
pub struct Context{
	pub:
		update_id i64 @[json:"update_id"]
		message Message @[json:"message"]
		edited_message Message @[json:"edited_message"]
		channel_post Message @[json:"channel_post"]
		edited_channel_post	Message @[json:"edited_channel_post"]
		business_message Message @[json:"business_message"]
		edited_business_message	Message @[json:"edited_business_message"]
		deleted_business_messages BusinessMessagesDeleted @[json:"deleted_business_messages"]
		message_reaction MessageReactionUpdate @[json:"message_reaction"]
		message_reaction_count MessageReactionCountUpdate @[json:"message_reaction_count"]

		inline_query InlineQuery @[json:"inline_query"]
		chosen_inline_result ChosenInlineResult @[json:"chosen_inline_result"]
		callback_query CallBackQuery @[json:"callback_query"]
		shipping_query ShippingQuery @[json:"shipping_query"]
		pre_checkout_query PreCheckoutQuery @[json:"pre_checkout_query"]
		paid_media_purchased PaidMediaPurchased @[json:"paid_media_purchased"]
}
pub struct Bot {
	pub:
		url string
	mut:
		msg_handlers []fn(Context,string)

}
