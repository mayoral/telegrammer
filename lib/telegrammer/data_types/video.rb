module Telegrammer
  module DataTypes
    # Telegram Video data type
    #
    # @attr [String] file_id Unique file identifier
    # @attr [Integer] width Video width as defined by sender
    # @attr [Integer] height Video height as defined by sender
    # @attr [Integer] duration Duration of the video in seconds as defined by sender
    # @attr [Telegrammer::DataTypes::PhotoSize] thumb Video thumbnail
    # @attr [String] mime_type Optional. Mime type of a file as defined by sender
    # @attr [String] file_size Optional. File size
    # @attr [String] caption Optional. Text description of the video (usually empty)
    #
    # See more at https://core.telegram.org/bots/api#video
    class Video < Telegrammer::DataTypes::Base
      attribute :file_id, String
      attribute :width, Integer
      attribute :height, Integer
      attribute :duration, Integer
      attribute :thumb, PhotoSize
      attribute :mime_type, String
      attribute :file_size, Integer
      attribute :caption, String
    end
  end
end
