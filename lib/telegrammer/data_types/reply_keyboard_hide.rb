module Telegrammer
  module DataTypes
    # Telegram ReplyKeyboardHide data type
    #
    # @attr [Boolean] hide_keyboard Requests clients to hide the custom keyboard
    # @attr [Boolean] selective Optional. Use this parameter if you want to hide keyboard for specific users only. Targets: 1) users that are @mentioned in the text of the Message object; 2) if the bot's message is a reply (has reply_to_message_id), sender of the original message.
    #
    # See more at https://core.telegram.org/bots/api#replykeyboardhide
    class ReplyKeyboardHide < Telegrammer::DataTypes::Base
      attribute :hide_keyboard, Boolean, default: true
      attribute :selective, Boolean, default: false
    end
  end
end
