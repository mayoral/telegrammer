module Telegrammer
  module DataTypes
    # Telegram ReplyKeyboardMarkup data type.
    #
    # This object represents a custom keyboard with reply options (see Introduction to bots for details and examples).
    #
    # @attr [Array] keyboard Array of button rows, each represented by an Array of Strings
    # @attr [Boolean] resize_keyboard Optional. Requests clients to resize the keyboard vertically for optimal fit. Defaults to false.
    # @attr [Boolean] one_time_keyboard Optional. Requests clients to hide the keyboard as soon as it's been used. Defaults to false.
    # @attr [Boolean] selective Optional. Use this parameter if you want to hide keyboard for specific users only. Targets: 1) users that are @mentioned in the text of the Message object; 2) if the bot's message is a reply (has reply_to_message_id), sender of the original message.
    #
    # See more at https://core.telegram.org/bots/api#replykeyboardmarkup
    class ReplyKeyboardMarkup < Telegrammer::DataTypes::Base
      attribute :keyboard, Array[Array[String]]
      attribute :resize_keyboard, Boolean, default: false
      attribute :one_time_keyboard, Boolean, default: false
      attribute :selective, Boolean, default: false
    end
  end
end
