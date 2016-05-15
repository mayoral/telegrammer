module Telegrammer
  module DataTypes
    # Telegram InlineQueryResultGif data type
    #
    # @attr [String] type Type of the result, must be gif
    # @attr [String] id Unique identifier for this result, 1-64 Bytes
    # @attr [String] gif_url A valid URL for the GIF file. File size must not exceed 1MB
    # @attr [String] gif_width Optional. Width of the GIF
    # @attr [String] gif_height Optional. Height of the GIF
    # @attr [String] thumb_url URL of the static thumbnail for the result (jpeg or gif)
    # @attr [String] title Optional. Title for the result
    # @attr [String] caption Optional. Caption of the GIF file to be sent, 0-200 characters
    # @attr [Telegrammer::DataTypes::InlineKeyboardMarkup] reply_markup Optional. Inline keyboard attached to the message
    # @attr [Telegrammer::DataTypes::InputMessageContent] input_message_content Content of the message to be sent
    #
    # See more at https://core.telegram.org/bots/api#inlinequeryresultgif
    class InlineQueryResultGif < Telegrammer::DataTypes::Base
      attribute :type, String, default: 'gif'
      attribute :id, String
      attribute :gif_url, String
      attribute :gif_height, String
      attribute :thumb_url, String
      attribute :title, String
      attribute :caption, String
      attribute :reply_markup, InlineKeyboardMarkup
      attribute :input_message_content, InputMessageContent
    end
  end
end
