module Telegrammer
  module DataTypes
    # Telegram InlineQueryResultCachedGif data type
    #
    # @attr [String] type Type of the result, must be gif
    # @attr [String] id Unique identifier for this result, 1-64 Bytes
    # @attr [String] gif_file_id A valid file identifier for the GIF file
    # @attr [String] title Optional. Title for the result
    # @attr [String] description Optional. Short description of the result
    # @attr [String] caption Optional. Caption of the GIF file to be sent, 0-200 characters
    # @attr [Telegrammer::DataTypes::InlineKeyboardMarkup] reply_markup Optional. An Inline keyboard attached to the message
    # @attr [Telegrammer::DataTypes::InputMessageContent] input_message_content Optional. Content of the message to be sent instead of the GIF animation
    #
    # See more at https://core.telegram.org/bots/api#inlinequeryresultcachedgif
    class InlineQueryResultCachedGif < Telegrammer::DataTypes::Base
      attribute :type, String, default: 'gif'
      attribute :id, String
      attribute :gif_file_id, String
      attribute :title, String
      attribute :description, String
      attribute :caption, String
      attribute :reply_markup, InlineKeyboardMarkup
      attribute :input_message_content, InputMessageContent
    end
  end
end
