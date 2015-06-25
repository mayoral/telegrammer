module Telegrammer
  module DataTypes
    class Audio < Telegrammer::DataTypes::Base
      attribute :file_id, String
      attribute :duration, Integer
      attribute :mime_type, String
      attribute :file_size, Integer
    end
  end
end
