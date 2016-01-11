module Telegrammer
  module DataTypes
    # Telegram InlineQueryResultPhoto data type
    #
    # @attr [String] type Type of the result, must be article
    # @attr [String] id Unique identifier for this result, 1-64 Bytes
    # @attr [String] photo_url A valid URL of the photo. Photo must be in jpeg format. Photo size must not exceed 5MB
    # @attr [Integer] photo_width Optional. Width of the photo
    # @attr [Integer] photo_height Optional. Height of the photo
    # @attr [String] thumb_url URL of the thumbnail for the photo
    # @attr [String] title Title of the result
    # @attr [String] description Optional. Short description of the result
    # @attr [String] caption Optional. Caption of the photo to be sent, 0-200 characters
    # @attr [String] message_text Optional. Text of a message to be sent instead of the photo, 1-512 characters
    # @attr [String] parse_mode Optional. Send “Markdown”, if you want Telegram apps to show bold, italic and inline URLs in your bot's message.
    # @attr [Boolean] disable_web_page_preview Optional. Disables link previews for links in the sent message
    #
    # See more at https://core.telegram.org/bots/api#inlinequeryresultphoto
    class InlineQueryResultPhoto < Telegrammer::DataTypes::Base
      attribute :type, String
      attribute :id, String
      attribute :photo_url, String
      attribute :photo_width, Integer
      attribute :photo_height, Integer
      attribute :thumb_url, String
      attribute :title, String
      attribute :description, String
      attribute :caption, String
      attribute :message_text, String
      attribute :parse_mode, String
      attribute :disable_web_page_preview, Boolean
    end
  end
end
