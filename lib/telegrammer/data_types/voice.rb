module Telegrammer
  module DataTypes
    # Telegram Voice data type
    #
    # @attr [String] file_id Unique file identifier
    # @attr [Integer] duration Duration of the audio in seconds as defined by sender
    # @attr [String] mime_type Optional. Mime type of a file as defined by sender
    # @attr [String] file_size Optional. File size
    #
    # See more at https://core.telegram.org/bots/api#video
    class Voice < Telegrammer::DataTypes::Base
      attribute :file_id, String
      attribute :duration, Integer
      attribute :mime_type, String
      attribute :file_size, Integer
    end
  end
end
