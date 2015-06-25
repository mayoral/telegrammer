module Telegrammer
  module DataTypes
    class Update < Telegrammer::DataTypes::Base
      attribute :update_id, Integer
      attribute :message, Message
    end
  end
end
