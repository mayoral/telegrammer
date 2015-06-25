module Telegrammer
  module DataTypes
    class Contact < Telegrammer::DataTypes::Base
      attribute :phone_number, String
      attribute :first_name, String
      attribute :last_name, String
      attribute :user_id, String
    end
  end
end
