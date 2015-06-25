module Telegrammer
  module DataTypes
    class Location < Telegrammer::DataTypes::Base
      attribute :longitude, Float
      attribute :latitude, Float
    end
  end
end
