module Telegrammer
  module DataTypes
    class UserProfilePhotos < Telegrammer::DataTypes::Base
      attribute :id, Integer
      attribute :first_name, String
      attribute :last_name, String
      attribute :photos, Array[PhotoSize]
    end
  end
end
