module Telegrammer
  module DataTypes
    # Telegram PhotoSize data type
    #
    # @attr [String] file_id Unique identifier for this file
    # @attr [Integer] width Photo width
    # @attr [Integer] height Photo height
    # @attr [Integer] file_size Optional. File size
    #
    # See more at https://core.telegram.org/bots/api#photosize
    class PhotoSize < Telegrammer::DataTypes::Base
      attribute :file_id, String
      attribute :width, Integer
      attribute :height, Integer
      attribute :file_size, Integer
    end
  end
end
