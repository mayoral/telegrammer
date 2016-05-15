module Telegrammer
  module DataTypes
    # Telegram InlineQueryResultContact data type
    #
    # @attr [String] type Type of the result, must be contact
    # @attr [String] id Unique identifier for this result, 1-64 Bytes
    # @attr [String] phone_number Contact's phone number
    # @attr [String] first_name Contact's first name
    # @attr [String] last_name Contact's last name
    # @attr [Telegrammer::DataTypes::InlineKeyboardMarkup] reply_markup Optional. Inline keyboard attached to the message
    # @attr [Telegrammer::DataTypes::InputMessageContent] input_message_content Optional. Content of the message to be sent instead of the contact
    # @attr [String] thumb_url Optional. Url of the thumbnail for the result
    # @attr [Integer] thumb_width Optional. Thumbnail width
    # @attr [Integer] thumb_height Optional. Thumbnail height
    #
    # See more at https://core.telegram.org/bots/api#inlinequeryresultcontact
    class InlineQueryResultContact < Telegrammer::DataTypes::Base
      attribute :type, String, default: 'contact'
      attribute :id, String
      attribute :phone_number, String
      attribute :first_name, String
      attribute :last_name, String
      attribute :reply_markup, InlineKeyboardMarkup
      attribute :input_message_content, InputMessageContent
      attribute :thumb_url, String
      attribute :thumb_width, Integer
      attribute :thumb_height, Integer
    end
  end
end
