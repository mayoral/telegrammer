module Telegrammer
  module DataTypes
    # Telegram InlineQueryResultVideo data type
    #
    # @attr [String] type Type of the result, must be video
    # @attr [String] id Unique identifier for this result, 1-64 bytes
    # @attr [String] video_url A valid URL for the embedded video player or video file
    # @attr [String] mime_type Mime type of the content of video url, “text/html” or “video/mp4”
    # @attr [String] message_text Text of the message to be sent with the video, 1-512 characters
    # @attr [String] parse_mode Optional. Send “Markdown”, if you want Telegram apps to show bold, italic and inline URLs in your bot's message.
    # @attr [Boolean] disable_web_page_preview Optional. Disables link previews for links in the sent message
    # @attr [Integer] video_width Optional. Video width
    # @attr [Integer] video_height Optional. Video height
    # @attr [Integer] video_duration Optional. Video duration in seconds
    # @attr [String] thumb_url URL of the thumbnail (jpeg only) for the video
    # @attr [String] title Title for the result
    # @attr [String] description Optional. Short description of the result
    #
    # See more at https://core.telegram.org/bots/api#inlinequeryresultvideo
    class InlineQueryResultVideo < Telegrammer::DataTypes::Base
      attribute :type, String, default: 'video'
      attribute :id, String
      attribute :video_url, String
      attribute :mime_type, String
      attribute :message_text, String
      attribute :parse_mode, String
      attribute :disable_web_page_preview, Boolean
      attribute :video_width, Integer
      attribute :video_height, Integer
      attribute :video_duration, Integer
      attribute :thumb_url, String
      attribute :title, String
      attribute :description, String
    end
  end
end
