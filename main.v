import tgv
fn main() {
	mut bot := tgv.new("<BOT-TOKEN>")
	bot.on(fn [bot](ctx tgv.MessageContext) {
		println(typeof(ctx.message.text).name)
		match ctx.message.text {

			"/help" {

				opts := {
					"parse_mode":"html",
				}
				bot.send_message(ctx.message.chat.id.str(),"<code>help</code>",opts) or {return}

			}

			else  {}
		}
		})
	bot.polling(false)!
}
