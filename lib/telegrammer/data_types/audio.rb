module Telegrammer
  module DataTypes
    # Telegram Audio data type
    #
    # @attr [String] file_id Unique identifier for this file
    # @attr [Integer] duration Duration of the audio in seconds as defined by sender
    # @attr [String] mime_type MIME type of the file as defined by sender
    # @attr [Integer] file_size File size
    #
    # See more at https://core.telegram.org/bots/api#audio
    class Audio < Telegrammer::DataTypes::Base
      # Unique identifier
      attribute :file_id, String
      attribute :duration, Integer
      attribute :mime_type, String
      attribute :file_size, Integer
    end
  end
end
