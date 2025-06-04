module tgv
import x.json2
// Bot Config
pub struct Bot {
	pub:
		url string
	mut:
		msg_handlers []fn(json2.Any,string)

}
