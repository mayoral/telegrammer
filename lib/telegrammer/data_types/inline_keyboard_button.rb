module Telegrammer
  module DataTypes
    # Telegram InlineKeyboardButton data type.
    #
    # This object represents one button of an inline keyboard. You must use
    # exactly one of the optional fields.
    #
    # @attr [String] text Label text on the button
    # @attr [String] url Optional. HTTP url to be opened when button is pressed
    # @attr [String] callback_data Optional. Data to be sent in a callback query to the bot when button is pressed, 1-64 bytes
    # @attr [String] switch_inline_query Optional. If set, pressing the button will prompt the user to select one of their chats, open that chat and insert the bot‘s username and the specified inline query in the input field. Can be empty, in which case just the bot’s username will be inserted.
    #
    # See more at https://core.telegram.org/bots/api#inlinekeyboardbutton
    class InlineKeyboardButton < Telegrammer::DataTypes::Base
      attribute :text, Integer
      attribute :url, String
      attribute :callback_data, String
      attribute :switch_inline_query, String
    end
  end
end
