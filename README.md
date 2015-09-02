[![Gem Version](https://badge.fury.io/rb/telegrammer.svg)](http://badge.fury.io/rb/telegrammer)
[![Code Climate](https://codeclimate.com/github/mayoral/telegrammer/badges/gpa.svg)](https://codeclimate.com/github/mayoral/telegrammer)
[![Inline docs](http://inch-ci.org/github/mayoral/telegrammer.svg?branch=master)](http://inch-ci.org/github/mayoral/telegrammer)
[![Gitter](https://badges.gitter.im/Join Chat.svg)](https://gitter.im/mayoral/telegrammer?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

# Telegrammer

Ruby client for the [Telegram's Bot API](https://core.telegram.org/bots/api).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'telegrammer'
```

And then execute:

    $ bundle

## Usage

First you'll need to register your bot and get an API token. To do that you have to talk with the [@BotFather](https://telegram.me/botfather).
Learn more about this [here](https://core.telegram.org/bots).

After getting your token, you can do things like this:

```ruby
require 'telegrammer'

bot = Telegrammer::Bot.new('[YOUR TELEGRAM TOKEN]')

bot.get_updates do |message|
  puts "In chat #{message.chat.id}, @#{message.from.username} said: #{message.text}"
  bot.send_message(chat_id: message.chat.id, text: "You said: #{message.text}")

  # Here you can also process message text to detect user commands
  # To learn more about commands, see https://core.telegram.org/bots#commands
end
```

This gem currently supports all operations exposed by the Telegram's Bot API. All the classes and methods are documented with examples, so please [check the documentation](http://www.rubydoc.info/gems/telegrammer/Telegrammer/Bot). Also you can [check the the wiki](https://github.com/mayoral/telegrammer/wiki), where you'll find more info about topics like [setting webhooks for your bot](https://github.com/mayoral/telegrammer/wiki/Using-webhooks).

## Contributing

1. Fork it: https://github.com/mayoral/telegrammer/fork
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
