module Telegrammer
  module DataTypes
    class ReplyKeyboardHide < Telegrammer::DataTypes::Base
      attribute :hide_keyboard, Boolean
      attribute :selective, Boolean
    end
  end
end
