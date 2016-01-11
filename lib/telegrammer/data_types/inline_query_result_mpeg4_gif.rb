module Telegrammer
  module DataTypes
    # Telegram InlineQueryResultMpeg4Gif data type
    #
    # @attr [String] type Type of the result, must be mpeg4_gif
    # @attr [String] id Unique identifier for this result, 1-64 bytes
    # @attr [String] mpeg4_url A valid URL for the MP4 file. File size must not exceed 1MB
    # @attr [Integer] mpeg4_width Optional. Video width
    # @attr [Integer] mpeg4_height Optional. Video height
    # @attr [String] thumb_url URL of the static thumbnail (jpeg or gif) for the result
    # @attr [String] title Optional. Title for the result
    # @attr [String] caption Optional. Caption of the MPEG-4 file to be sent, 0-200 characters
    # @attr [String] message_text Optional. Text of a message to be sent instead of the animation, 1-512 characters
    # @attr [String] parse_mode Optional. Send “Markdown”, if you want Telegram apps to show bold, italic and inline URLs in your bot's message.
    # @attr [Boolean] disable_web_page_preview Optional. Disables link previews for links in the sent message
    #
    # See more at https://core.telegram.org/bots/api#inlinequeryresultmpeg4gif
    class InlineQueryResultMpeg4Gif < Telegrammer::DataTypes::Base
      attribute :type, String
      attribute :id, String
      attribute :mpeg4_url, String
      attribute :mpeg4_width, Integer
      attribute :mpeg4_height, Integer
      attribute :thumb_url, String
      attribute :title, String
      attribute :caption, String
      attribute :message_text, String
      attribute :parse_mode, String
      attribute :disable_web_page_preview, Boolean
    end
  end
end
