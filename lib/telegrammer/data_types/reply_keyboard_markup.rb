module Telegrammer
  module DataTypes
    class ReplyKeyboardMarkup < Telegrammer::DataTypes::Base
      attribute :keyboard, Array[Array[String]]
      attribute :resize_keyboard, Boolean, default: false
      attribute :one_time_keyboard, Boolean, default: false
      attribute :selective, Boolean, default: false
    end
  end
end
