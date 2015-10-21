module Telegrammer
  module DataTypes
    # Telegram File data type.
    #
    # @attr [String] file_id Unique identifier for this file
    # @attr [Integer] file_size Optional. File size, if known
    # @attr [String] file_path Optional. File path. Use https://api.telegram.org/file/bot<token>/<file_path> to get the file.
    #
    # See more at https://core.telegram.org/bots/api#file
    class File < Telegrammer::DataTypes::Base
      attribute :file_id, String
      attribute :file_size, Integer
      attribute :file_path, String
    end
  end
end
