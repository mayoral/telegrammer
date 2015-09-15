module Telegrammer
  module DataTypes
    # Telegram Audio data type
    #
    # @attr [String] file_id Unique identifier for this file
    # @attr [Integer] duration Duration of the audio in seconds as defined by sender
    # @attr [String] performer Optional. Performer of the audio as defined by sender or by audio tags
    # @attr [String] title Optional. Title of the audio as defined by sender or by audio tags
    # @attr [String] mime_type Optional. MIME type of the file as defined by sender
    # @attr [Integer] file_size Optional. File size
    #
    # See more at https://core.telegram.org/bots/api#audio
    class Audio < Telegrammer::DataTypes::Base
      # Unique identifier
      attribute :file_id, String
      attribute :duration, Integer
      attribute :performer, String
      attribute :title, String
      attribute :mime_type, String
      attribute :file_size, Integer
    end
  end
end
