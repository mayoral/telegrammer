module Telegrammer
  module DataTypes
    # Telegram InlineQueryResultCachedAudio data type
    #
    # @attr [String] type Type of the result, must be audio
    # @attr [String] id Unique identifier for this result, 1-64 Bytes
    # @attr [String] audio_file_id A valid file identifier for the audio file
    # @attr [Telegrammer::DataTypes::InlineKeyboardMarkup] reply_markup Optional. An Inline keyboard attached to the message
    # @attr [Telegrammer::DataTypes::InputMessageContent] input_message_content Optional. Content of the message to be sent instead of the audio
    #
    # See more at https://core.telegram.org/bots/api#inlinequeryresultcachedaudio
    class InlineQueryResultCachedAudio < Telegrammer::DataTypes::Base
      attribute :type, String, default: 'audio'
      attribute :id, String
      attribute :audio_file_id, String
      attribute :reply_markup, InlineKeyboardMarkup
      attribute :input_message_content, InputMessageContent
    end
  end
end
