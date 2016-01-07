module Telegrammer
  module DataTypes
    # Telegram Chat data type
    #
    # @attr [Integer] id Unique identifier for this chat, not exceeding 1e13 by absolute value
    # @attr [String] type Type of chat, can be either “private”, “group”, “supergroup” or “channel”
    # @attr [String] title Optional. Title, for channels and group chats
    # @attr [String] username Optional. Username, for private chats and channels if available
    # @attr [String] first_name Optional. First name of the other party in a private chat
    # @attr [String] last_name Optional. Last name of the other party in a private chat
    #
    # See more at https://core.telegram.org/bots/api#chat
    class Chat < Telegrammer::DataTypes::Base
      attribute :id, Integer
      attribute :type, String
      attribute :title, String
      attribute :username, String
      attribute :first_name, String
      attribute :last_name, String
    end
  end
end
