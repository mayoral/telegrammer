module Telegrammer
  module DataTypes
    # Telegram InlineQueryResultVoice data type
    #
    # @attr [String] type Type of the result, must be voice
    # @attr [String] id Unique identifier for this result, 1-64 bytes
    # @attr [String] voice_url A valid URL for the voice encoding
    # @attr [String] title Recording title
    # @attr [Integer] voice_duration Optional. Recording duration in seconds
    # @attr [Telegrammer::DataTypes::InlineKeyboardMarkup] reply_markup Optional. Inline keyboard attached to the message
    # @attr [Telegrammer::DataTypes::InputMessageContent] input_message_content Content of the message to be sent
    #
    # See more at https://core.telegram.org/bots/api#inlinequeryresultvoice
    class InlineQueryResultVoice < Telegrammer::DataTypes::Base
      attribute :type, String, default: 'voice'
      attribute :id, String
      attribute :voice_url, String
      attribute :title, String
      attribute :voice_duration, Integer
      attribute :reply_markup, InlineKeyboardMarkup
      attribute :input_message_content, InputMessageContent
    end
  end
end
