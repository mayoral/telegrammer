module Telegrammer
  module DataTypes
    # Telegram Update data type.
    #
    # This object represents an incoming update.
    # Only one of the optional parameters can be present in any given update.
    #
    # @attr [Integer] update_id The update‘s unique identifier. Update identifiers start from a certain positive number and increase sequentially.
    # @attr [Telegrammer::DataTypes::Message] message Optional. New incoming message of any kind - text, photo, sticker, etc.
    # @attr [Telegrammer::DataTypes::InlineQuery] inline_query Optional. New incoming inline query.
    # @attr [Telegrammer::DataTypes::ChosenInlineResult] chosen_inline_result Optional. The result of an inline query that was chosen by a user and sent to their chat partner.
    # @attr [Telegrammer::DataTypes::CallbackQuery] chosen_inline_result Optional. New incoming callback query.
    #
    # See more at https://core.telegram.org/bots/api#update
    class Update < Telegrammer::DataTypes::Base
      attribute :update_id, Integer
      attribute :message, Message
      attribute :inline_query, InlineQuery
      attribute :chosen_inline_result, ChosenInlineResult
      attribute :callback_query, CallbackQuery
    end
  end
end
