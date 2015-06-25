module Telegrammer
  module DataTypes
    class User < Telegrammer::DataTypes::Base
      attribute :id, Integer
      attribute :first_name, String
      attribute :last_name, String
      attribute :username, String
    end
  end
end
