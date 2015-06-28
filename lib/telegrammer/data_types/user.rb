module Telegrammer
  module DataTypes
    # Telegram User data type.
    #
    # @attr [Integer] id Unique identifier for this user or bot
    # @attr [String] first_name User‘s or bot’s first name
    # @attr [String] last_name Optional. User‘s or bot’s last name
    # @attr [String] username Optional. User‘s or bot’s username
    #
    # See more at https://core.telegram.org/bots/api#user
    class User < Telegrammer::DataTypes::Base
      attribute :id, Integer
      attribute :first_name, String
      attribute :last_name, String
      attribute :username, String
    end
  end
end
