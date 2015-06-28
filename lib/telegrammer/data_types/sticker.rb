module Telegrammer
  module DataTypes
    # Telegram Sticker data type.
    #
    # @attr [String] file_id Unique identifier for this file
    # @attr [Integer] width Sticker width
    # @attr [Integer] height Sticker height
    # @attr [Telegrammer::DataTypes::PhotoSize] thumb Sticker thumbnail in .webp or .jpg format
    # @attr [Integer] file_id Optional. File size
    #
    # See more at https://core.telegram.org/bots/api#sticker
    class Sticker < Telegrammer::DataTypes::Base
      attribute :file_id, String
      attribute :width, Integer
      attribute :height, Integer
      attribute :thumb, PhotoSize
      attribute :file_size, Integer
    end
  end
end
