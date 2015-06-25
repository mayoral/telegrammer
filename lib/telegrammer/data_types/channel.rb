module Telegrammer
  module DataTypes
    class Channel < Telegrammer::DataTypes::Base
      attribute :id, Integer

      def coerce(value)
        value.respond_to?(:first_name) ? User.new(value) : GroupChat.new(value)
      end
    end
  end
end
