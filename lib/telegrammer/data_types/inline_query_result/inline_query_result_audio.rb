module Telegrammer
  module DataTypes
    # Telegram InlineQueryResultAudio data type
    #
    # @attr [String] type Type of the result, must be audio
    # @attr [String] id Unique identifier for this result, 1-64 Bytes
    # @attr [String] audio_url A valid URL for the audio file
    # @attr [String] title Title of the result
    # @attr [String] performer Optional. Performer
    # @attr [Integer] audio_duration Optional. Audio duration in seconds
    # @attr [Telegrammer::DataTypes::InlineKeyboardMarkup] reply_markup Optional. Inline keyboard attached to the message
    # @attr [Telegrammer::DataTypes::InputMessageContent] input_message_content Content of the message to be sent instead of the audio
    #
    # See more at https://core.telegram.org/bots/api#inlinequeryresultaudio
    class InlineQueryResultAudio < Telegrammer::DataTypes::Base
      attribute :type, String, default: 'audio'
      attribute :id, String
      attribute :audio_url, String
      attribute :title, String
      attribute :performer, String
      attribute :audio_duration, Integer
      attribute :reply_markup, InlineKeyboardMarkup
      attribute :input_message_content, InputMessageContent
    end
  end
end
