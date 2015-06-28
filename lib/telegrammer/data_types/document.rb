module Telegrammer
  module DataTypes
    # Telegram Document data type
    #
    # @attr [String] file_id Unique file identifier
    # @attr [Telegrammer::DataTypes::PhotoSize] thumb Document thumbnail as defined by sender
    # @attr [String] file_name Optional. Original filename as defined by sender
    # @attr [String] mime_type Optional. MIME type of the file as defined by sender
    # @attr [String] file_size Optional. File size
    #
    # See more at https://core.telegram.org/bots/api#document
    class Document < Telegrammer::DataTypes::Base
      attribute :file_id, String
      attribute :thumb, PhotoSize
      attribute :file_name, String
      attribute :mime_type, String
      attribute :file_size, Integer
    end
  end
end
