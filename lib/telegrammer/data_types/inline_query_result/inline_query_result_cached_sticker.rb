module Telegrammer
  module DataTypes
    # Telegram InlineQueryResultCachedSticker data type
    #
    # @attr [String] type Type of the result, must be sticker
    # @attr [String] id Unique identifier for this result, 1-64 Bytes
    # @attr [String] sticker_file_id A valid file identifier of the sticker
    # @attr [Telegrammer::DataTypes::InlineKeyboardMarkup] reply_markup Optional. An Inline keyboard attached to the message
    # @attr [Telegrammer::DataTypes::InputMessageContent] input_message_content Optional. Content of the message to be sent instead of the sticker
    #
    # See more at https://core.telegram.org/bots/api#inlinequeryresultcacheddocument
    class InlineQueryResultCachedSticker < Telegrammer::DataTypes::Base
      attribute :type, String, default: 'sticker'
      attribute :id, String
      attribute :sticker_file_id, String
      attribute :reply_markup, InlineKeyboardMarkup
      attribute :input_message_content, InputMessageContent
    end
  end
end
