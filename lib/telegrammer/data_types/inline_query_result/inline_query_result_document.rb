module Telegrammer
  module DataTypes
    # Telegram InlineQueryResultDocument data type
    #
    # @attr [String] type Type of the result, must be document
    # @attr [String] id Unique identifier for this result, 1-64 Bytes
    # @attr [String] title Title of the result
    # @attr [String] caption Optional. Caption of the document to be sent, 0-200 characters
    # @attr [String] document_url A valid URL for the file
    # @attr [String] mime_type Mime type of the content of the file, either "application/pdf" or "application/zip"
    # @attr [String] description Optional. Short description of the result
    # @attr [Telegrammer::DataTypes::InlineKeyboardMarkup] reply_markup Optional. Inline keyboard attached to the message
    # @attr [Telegrammer::DataTypes::InputMessageContent] input_message_content Content of the message to be sent instead of the file
    # @attr [String] thumb_url Optional. Url of the thumbnail for the result
    # @attr [Integer] thumb_width Optional. Thumbnail width
    # @attr [Integer] thumb_height Optional. Thumbnail height
    #
    # See more at https://core.telegram.org/bots/api#inlinequeryresultdocument
    class InlineQueryResultDocument < Telegrammer::DataTypes::Base
      attribute :type, String, default: 'document'
      attribute :id, String
      attribute :title, String
      attribute :caption, String
      attribute :document_url, String
      attribute :mime_type, String
      attribute :description, String
      attribute :reply_markup, InlineKeyboardMarkup
      attribute :input_message_content, InputMessageContent
      attribute :thumb_url, String
      attribute :thumb_width, Integer
      attribute :thumb_height, Integer
    end
  end
end
