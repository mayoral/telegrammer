module Telegrammer
  module DataTypes
    class PhotoSize < Telegrammer::DataTypes::Base
      attribute :file_id, String
      attribute :width, Integer
      attribute :height, Integer
      attribute :file_size, Integer
    end
  end
end
