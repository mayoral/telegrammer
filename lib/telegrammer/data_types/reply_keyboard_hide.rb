module Telegrammer
  module DataTypes
    class ReplyKeyboardHide < Telegrammer::DataTypes::Base
      attribute :hide_keyboard, Boolean, default: true
      attribute :selective, Boolean, default: false
    end
  end
end
