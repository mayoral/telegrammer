module Telegrammer
  module DataTypes
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
