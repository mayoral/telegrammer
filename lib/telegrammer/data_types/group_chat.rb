module Telegrammer
  module DataTypes
    # Telegram GroupChat data type
    #
    # @attr [Integer] id Unique identifier for this group chat
    # @attr [String] title Group name
    #
    # See more at https://core.telegram.org/bots/api#groupchat
    class GroupChat < Telegrammer::DataTypes::Base
      attribute :id, Integer
      attribute :title, String
    end
  end
end
