module Telegrammer
  module DataTypes
    # Telegram InlineKeyboardMarkup data type.
    #
    # This object represents an inline keyboard that appears right next to the message it belongs to.
    #
    # @attr [Array] inline_keyboard Array of button rows, each represented by an Array of InlineKeyboardButton objects
    #
    # See more at https://core.telegram.org/bots/api#inlinekeyboardmarkup
    class InlineKeyboardMarkup < Telegrammer::DataTypes::Base
      attribute :inline_keyboard, Array[Array[InlineKeyboardButton]]
    end
  end
end
