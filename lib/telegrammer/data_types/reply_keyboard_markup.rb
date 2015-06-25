module Telegrammer
  module DataTypes
    class ReplyKeyboardMarkup < Telegrammer::DataTypes::Base
      attribute :keyboard, Array[Array[String]]
      attribute :resize_keyboard, Boolean
      attribute :one_time_keyboard, Boolean
      attribute :selective, Boolean
    end
  end
end
