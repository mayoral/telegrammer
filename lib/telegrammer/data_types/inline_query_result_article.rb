module Telegrammer
  module DataTypes
    # Telegram InlineQueryResultArticle data type
    #
    # @attr [String] type Type of the result, must be article
    # @attr [String] id Unique identifier for this result, 1-64 Bytes
    # @attr [String] title Title of the result
    # @attr [String] message_text Text of the message to be sent
    # @attr [String] parse_mode Optional. Send “Markdown”, if you want Telegram apps to show bold, italic and inline URLs in your bot's message.
    # @attr [Boolean] disable_web_page_preview Optional. Disables link previews for links in the sent message
    # @attr [String] url Optional. URL of the result
    # @attr [Boolean] hide_url Optional. Pass True, if you don't want the URL to be shown in the message
    # @attr [String] description Optional. Short description of the result
    # @attr [String] thumb_url Optional. Url of the thumbnail for the result
    # @attr [Integer] thumb_width Optional. Thumbnail width
    # @attr [Integer] thumb_height Optional. Thumbnail height
    #
    # See more at https://core.telegram.org/bots/api#inlinequeryresultarticle
    class InlineQueryResultArticle < Telegrammer::DataTypes::Base
      attribute :type, String
      attribute :id, String
      attribute :title, String
      attribute :message_text, String
      attribute :parse_mode, String
      attribute :disable_web_page_preview, Boolean
      attribute :url, String
      attribute :hide_url, Boolean
      attribute :description, String
      attribute :thumb_url, String
      attribute :thumb_width, Integer
    end
  end
end
