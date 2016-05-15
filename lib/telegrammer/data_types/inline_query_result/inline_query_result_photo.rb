module Telegrammer
  module DataTypes
    # Telegram InlineQueryResultPhoto data type
    #
    # @attr [String] type Type of the result, must be photo
    # @attr [String] id Unique identifier for this result, 1-64 Bytes
    # @attr [String] photo_url A valid URL of the photo. Photo must be in jpeg format. Photo size must not exceed 5MB
    # @attr [String] thumb_url URL of the thumbnail for the photo
    # @attr [Integer] photo_width Optional. Width of the photo
    # @attr [Integer] photo_height Optional. Height of the photo
    # @attr [String] title Optional. Title of the result
    # @attr [String] description Optional. Short description of the result
    # @attr [String] caption Optional. Caption of the photo to be sent, 0-200 characters
    # @attr [Telegrammer::DataTypes::InlineKeyboardMarkup] reply_markup Optional. Inline keyboard attached to the message
    # @attr [Telegrammer::DataTypes::InputMessageContent] input_message_content Content of the message to be sent instead of the photo
    #
    # See more at https://core.telegram.org/bots/api#inlinequeryresultphoto
    class InlineQueryResultPhoto < Telegrammer::DataTypes::Base
      attribute :type, String, default: 'photo'
      attribute :id, String
      attribute :photo_url, String
      attribute :thumb_url, String
      attribute :photo_width, Integer
      attribute :photo_height, Integer
      attribute :title, String
      attribute :description, String
      attribute :caption, String
      attribute :reply_markup, InlineKeyboardMarkup
      attribute :input_message_content, InputMessageContent
    end
  end
end
