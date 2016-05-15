module Telegrammer
  module DataTypes
    # Telegram InlineQueryResultLocation data type
    #
    # @attr [String] type Type of the result, must be location
    # @attr [String] id Unique identifier for this result, 1-64 Bytes
    # @attr [Float] latitude Location latitude in degrees
    # @attr [Float] longitude Location longitude in degrees
    # @attr [String] title Location title
    # @attr [Telegrammer::DataTypes::InlineKeyboardMarkup] reply_markup Optional. Inline keyboard attached to the message
    # @attr [Telegrammer::DataTypes::InputMessageContent] input_message_content Content of the message to be sent instead of the location
    # @attr [String] thumb_url Optional. Url of the thumbnail for the result
    # @attr [Integer] thumb_width Optional. Thumbnail width
    # @attr [Integer] thumb_height Optional. Thumbnail height
    #
    # See more at https://core.telegram.org/bots/api#inlinequeryresultlocation
    class InlineQueryResultLocation < Telegrammer::DataTypes::Base
      attribute :type, String, default: 'location'
      attribute :id, String
      attribute :latitude, Float
      attribute :longitude, Float
      attribute :title, String
      attribute :reply_markup, InlineKeyboardMarkup
      attribute :input_message_content, InputMessageContent
      attribute :thumb_url, String
      attribute :thumb_width, Integer
      attribute :thumb_height, Integer
    end
  end
end
