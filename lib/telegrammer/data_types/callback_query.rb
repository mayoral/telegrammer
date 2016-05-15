module Telegrammer
  module DataTypes
    # Telegram CallbackQuery data type.
    #
    # This object represents an incoming callback query from a callback button
    # in an inline keyboard. If the button that originated the query was
    # attached to a message sent by the bot, the field message will be
    # presented. If the button was attached to a message sent via the bot
    # (in inline mode), the field inline_message_id will be presented.
    #
    # @attr [String] id Unique identifier for this query
    # @attr [Telegrammer::DataTypes::User] from Sender
    # @attr [Telegrammer::DataTypes::Message] message Optional. Message with the callback button that originated the query. Note that message content and message date will not be available if the message is too old
    # @attr [String] inline_message_id Optional. Identifier of the message sent via the bot in inline mode, that originated the query
    # @attr [String] data Data associated with the callback button. Be aware that a bad client can send arbitrary data in this field
    #
    # See more at https://core.telegram.org/bots/api#user
    class CallbackQuery < Telegrammer::DataTypes::Base
      attribute :id, String
      attribute :from, User
      attribute :message, Message
      attribute :inline_message_id, String
      attribute :data, String
    end
  end
end
