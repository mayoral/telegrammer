module Telegrammer
  module DataTypes
    # Telegram InlineQueryResultCachedPhoto data type
    #
    # @attr [String] type Type of the result, must be photo
    # @attr [String] id Unique identifier for this result, 1-64 Bytes
    # @attr [String] photo_file_id A valid file identifier of the photo
    # @attr [String] title Title for the result
    # @attr [String] description Optional. Short description of the result
    # @attr [String] caption Optional. Caption of the photo to be sent, 0-200 characters
    # @attr [Telegrammer::DataTypes::InlineKeyboardMarkup] reply_markup Optional. An Inline keyboard attached to the message
    # @attr [Telegrammer::DataTypes::InputMessageContent] input_message_content Optional. Content of the message to be sent instead of the audio
    #
    # See more at https://core.telegram.org/bots/api#inlinequeryresultcachedphoto
    class InlineQueryResultCachedPhoto < Telegrammer::DataTypes::Base
      attribute :type, String, default: 'photo'
      attribute :id, String
      attribute :photo_file_id, String
      attribute :title, String
      attribute :description, String
      attribute :caption, String
      attribute :reply_markup, InlineKeyboardMarkup
      attribute :input_message_content, InputMessageContent
    end
  end
end
