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

All current actions are supported by the gem. Here's an example for each action:

```ruby
require 'telegrammer'

bot = TelegramBot.new('[YOUR TELEGRAM TOKEN]')

# GET UPDATES
# https://core.telegram.org/bots/api/#getupdates
bot.get_updates do |message|
  puts "In chat #{message.chat.id}, @#{message.from.username} said: #{message.text}"
  bot.send_message(chat_id: message.chat.id, text: "You said: #{message.text}")

  # Here you can also process message text to detect user commands
  # To learn more about commands, see https://core.telegram.org/bots#commands
end

# SEND MESSAGES
# https://core.telegram.org/bots/api/#sendmessage
bot.send_message(chat_id: 123456789, text: "This is a text")

# https://core.telegram.org/bots/api/#replykeyboardmarkup
reply_markup = Telegrammer::DataTypes::ReplyKeyboardMarkup.new(
  keyboard: [
    ["Option 1.1", "Option 1.2"],
    ["Option 2"],
    ["Option 3.1", "Option 3.2", "Option 3.3"]
  ],
  resize_keyboard: false
)

# This message will activate a custom keyboard...
bot.send_message(
  chat_id: 1460713,
  text: "Select an option"
  reply_markup: reply_markup
)

# https://core.telegram.org/bots/api/#replykeyboardhide
reply_markup = Telegrammer::DataTypes::ReplyKeyboardHide.new(
  hide_keyboard: true
)

# And this message will disable it
bot.send_message(
  chat_id: 1460713,
  text: "Thanks",
  reply_markup: reply_markup
)

# FORWARDING A MESSAGE
# https://core.telegram.org/bots/api/#forwardmessage
bot.forward_message(chat_id: 123456789, from_chat_id: 987654321, message_id: 111222333)

# SENDING PHOTOS
# https://core.telegram.org/bots/api/#sendphoto
image_file = File.open("foo.jpg")
bot.send_document(chat_id: 123456789, document: image_file)

# SENDING AUDIO FILES
# https://core.telegram.org/bots/api/#sendaudio
audio_file = File.open("foo.ogg")
bot.send_audio(chat_id: 123456789, audio: audio_file)

# SENDING DOCUMENTS
# https://core.telegram.org/bots/api/#senddocument
my_secret_file = File.open("secret.txt")
bot.send_document(chat_id: 123456789, document: my_secret_file)

# SENDING STICKERS
# https://core.telegram.org/bots/api/#sendsticker
sticker_image_file = File.open("sticker.jpg")
bot.send_audio(chat_id: 123456789, audio: sticker_image_file)

# SENDING VIDEOS
# https://core.telegram.org/bots/api/#sendvideo
video_file = File.open("foo.mp4")
bot.send_audio(chat_id: 123456789, video: video_file)

# SENDING DOCUMENTS
# https://core.telegram.org/bots/api/#senddocument
file = File.open("foo.ogg")
bot.send_audio(chat_id: 123456789, audio: file)

# SENDING LOCATIONS
# https://core.telegram.org/bots/api/#sendlocation
bot.send_location(chat_id: 123456789, latitude: 38.775539, longitude: -4.829988)

# SENDING CHAT ACTIONS
# https://core.telegram.org/bots/api/#sendchataction
bot.send_chat_action(chat_id: 123456789, action: "typing")

# GETTING USER PROFILE PHOTOS
# https://core.telegram.org/bots/api/#getuserprofilephotos
bot.get_user_profile_photos(user_id: 123456789)
```

## Contributing

1. Fork it ( https://github.com/mayoral/telegrammer/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
