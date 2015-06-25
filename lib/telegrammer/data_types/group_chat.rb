module Telegrammer
  module DataTypes
    class GroupChat < Telegrammer::DataTypes::Base
      attribute :id, Integer
      attribute :title, String
    end
  end
end
