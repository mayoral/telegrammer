module Telegrammer
  module DataTypes
    # Telegram InlineQueryResultCachedVoice data type
    #
    # @attr [String] type Type of the result, must be voice
    # @attr [String] id Unique identifier for this result, 1-64 Bytes
    # @attr [String] voice_file_id A valid file identifier for the voice message
    # @attr [String] title Title for the result
    # @attr [Telegrammer::DataTypes::InlineKeyboardMarkup] reply_markup Optional. An Inline keyboard attached to the message
    # @attr [Telegrammer::DataTypes::InputMessageContent] input_message_content Optional. Content of the message to be sent instead of the voice message
    #
    # See more at https://core.telegram.org/bots/api#inlinequeryresultcachedvoice
    class InlineQueryResultCachedVoice < Telegrammer::DataTypes::Base
      attribute :type, String, default: 'voice'
      attribute :id, String
      attribute :voice_file_id, String
      attribute :title, String
      attribute :reply_markup, InlineKeyboardMarkup
      attribute :input_message_content, InputMessageContent
    end
  end
end
