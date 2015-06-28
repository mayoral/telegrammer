module Telegrammer
  module DataTypes
    # Telegram Contact data type
    #
    # @attr [String] phone_number Contact's phone number
    # @attr [String] first_name Contact's first name
    # @attr [String] last_name Optional. Contact's last name
    # @attr [String] user_id Optional. Contact's user identifier in Telegram
    #
    # See more at https://core.telegram.org/bots/api#contact
    class Contact < Telegrammer::DataTypes::Base
      attribute :phone_number, String
      attribute :first_name, String
      attribute :last_name, String
      attribute :user_id, String
    end
  end
end
