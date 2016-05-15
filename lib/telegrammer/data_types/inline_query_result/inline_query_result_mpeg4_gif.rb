module Telegrammer
  module DataTypes
    # Telegram InlineQueryResultMpeg4Gif data type
    #
    # @attr [String] type Type of the result, must be mpeg4_gif
    # @attr [String] id Unique identifier for this result, 1-64 bytes
    # @attr [String] mpeg4_url A valid URL for the MP4 file. File size must not exceed 1MB
    # @attr [Integer] mpeg4_width Optional. Video width
    # @attr [Integer] mpeg4_height Optional. Video height
    # @attr [String] thumb_url URL of the static thumbnail (jpeg or gif) for the result
    # @attr [String] title Optional. Title for the result
    # @attr [String] caption Optional. Caption of the MPEG-4 file to be sent, 0-200 characters
    # @attr [Telegrammer::DataTypes::InlineKeyboardMarkup] reply_markup Optional. Inline keyboard attached to the message
    # @attr [Telegrammer::DataTypes::InputMessageContent] input_message_content Content of the message to be sent instead of the video animation
    #
    # See more at https://core.telegram.org/bots/api#inlinequeryresultmpeg4gif
    class InlineQueryResultMpeg4Gif < Telegrammer::DataTypes::Base
      attribute :type, String, default: 'mpeg4_gif'
      attribute :id, String
      attribute :mpeg4_url, String
      attribute :mpeg4_width, Integer
      attribute :mpeg4_height, Integer
      attribute :thumb_url, String
      attribute :title, String
      attribute :caption, String
      attribute :reply_markup, InlineKeyboardMarkup
      attribute :input_message_content, InputMessageContent
    end
  end
end
