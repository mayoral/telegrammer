module Telegrammer
  module DataTypes
    # Telegram ChosenInlineResult data type
    #
    # @attr [String] result_id The unique identifier for the result that was chosen.
    # @attr [Telegrammer::DataTypes::User] from The user that chose the result.
    # @attr [String] query The query that was used to obtain the result.
    #
    # See more at https://core.telegram.org/bots/api#choseninlineresult
    class ChosenInlineResult < Telegrammer::DataTypes::Base
      attribute :result_id, String
      attribute :from, User
      attribute :string, String
    end
  end
end
