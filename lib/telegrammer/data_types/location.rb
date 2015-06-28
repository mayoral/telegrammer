module Telegrammer
  module DataTypes
    # Telegram Location data type
    #
    # @attr [Float] latitude Latitude as defined by sender
    # @attr [Float] longitude Longitude as defined by sender
    #
    # See more at https://core.telegram.org/bots/api#location
    class Location < Telegrammer::DataTypes::Base
      attribute :latitude, Float
      attribute :longitude, Float
    end
  end
end
