module Telegrammer
  module DataTypes
    # Telegram InlineQueryResultGif data type
    #
    # @attr [String] type Type of the result, must be gif
    # @attr [String] id Unique identifier for this result, 1-64 bytes
    # @attr [String] gif_url A valid URL for the GIF file. File size must not exceed 1MB
    # @attr [Integer] gif_width Optional. Width of the GIF
    # @attr [Integer] gif_height Optional. Height of the GIF
    # @attr [String] thumb_url URL of the static thumbnail for the result (jpeg or gif)
    # @attr [String] title Optional. Title for the result
    # @attr [String] caption Optional. Caption of the GIF file to be sent, 0-200 characters
    # @attr [String] message_text Optional. Text of a message to be sent instead of the animation, 1-512 characters
    # @attr [String] parse_mode Optional. Send “Markdown”, if you want Telegram apps to show bold, italic and inline URLs in your bot's message.
    # @attr [Boolean] disable_web_page_preview Optional. Disables link previews for links in the sent message
    #
    # See more at https://core.telegram.org/bots/api#inlinequeryresultgif
    class InlineQueryResultGif < Telegrammer::DataTypes::Base
      attribute :type, String
      attribute :id, String
      attribute :gif_url, String
      attribute :gif_width, Integer
      attribute :git_height, Integer
      attribute :thumb_url, String
      attribute :title, String
      attribute :caption, String
      attribute :message_text, String
      attribute :parse_mode, String
      attribute :disable_web_page_preview, Boolean
    end
  end
end
