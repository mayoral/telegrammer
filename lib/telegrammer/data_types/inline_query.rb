module Telegrammer
  module DataTypes
    # Telegram InlineQuery data type
    #
    # @attr [String] id Unique identifier for this query
    # @attr [Telegrammer::DataTypes::User] from Sender
    # @attr [String] query Text of the query
    # @attr [String] offset Offset of the results to be returned, can be controlled by the bot
    #
    # See more at https://core.telegram.org/bots/api#inlinequery
    class InlineQuery < Telegrammer::DataTypes::Base
      attribute :id, String
      attribute :from, User
      attribute :query, String
      attribute :offset, String
      attribute :title, String
    end
  end
end
