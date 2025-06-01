import tgv
import x.json2
// make bot

bot := tgv.new("<BOT-TOKEN>")

// USE api for example

bot.get_me()
// etc ... see in ref

// options map

// example

opts := {
	"parse_mode":"html",
}
// btw you need to make id if int to string using id.str()
bot.send_message(id,"msg",opts)
// empty options

bot.send_message(id,"msg",map[string]string{})

// btw if something went wrong see compiler output maybe you need to add or | !

// for bot message Context
bot.on(fn [bot](ctx json2.Any,typeo string){})
// pass a func to handler pass bot into the scope 2 params one is Context and two is type of context
