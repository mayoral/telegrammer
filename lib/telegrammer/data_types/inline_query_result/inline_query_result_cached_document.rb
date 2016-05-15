module Telegrammer
  module DataTypes
    # Telegram InlineQueryResultCachedDocument data type
    #
    # @attr [String] type Type of the result, must be document
    # @attr [String] id Unique identifier for this result, 1-64 Bytes
    # @attr [String] title Title for the result
    # @attr [String] document_file_id A valid file identifier for the file
    # @attr [String] description Optional. Short description of the result
    # @attr [String] caption Optional. Caption of the document to be sent, 0-200 characters
    # @attr [Telegrammer::DataTypes::InlineKeyboardMarkup] reply_markup Optional. An Inline keyboard attached to the message
    # @attr [Telegrammer::DataTypes::InputMessageContent] input_message_content Optional. Content of the message to be sent instead of the document
    #
    # See more at https://core.telegram.org/bots/api#inlinequeryresultcacheddocument
    class InlineQueryResultCachedDocument < Telegrammer::DataTypes::Base
      attribute :type, String, default: 'document'
      attribute :id, String
      attribute :title, String
      attribute :document_file_id, String
      attribute :description, String
      attribute :caption, String
      attribute :reply_markup, InlineKeyboardMarkup
      attribute :input_message_content, InputMessageContent
    end
  end
end
