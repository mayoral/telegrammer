module Telegrammer
  module DataTypes
    # Telegram UserProfilePhotos data type.
    #
    # @attr [Integer] total_count Total number of profile pictures the target user has
    # @attr [Telegrammer::DataTypes::PhotoSize] photos Requested profile pictures (in up to 4 sizes each)
    #
    # See more at https://core.telegram.org/bots/api#userprofilephotos
    class UserProfilePhotos < Telegrammer::DataTypes::Base
      attribute :total_count, Integer
      attribute :photos, PhotoArray
    end
  end
end
