module Telegrammer
  module DataTypes
    # Telegram InlineQueryResultArticle data type
    #
    # @attr [String] type Type of the result, must be article
    # @attr [String] id Unique identifier for this result, 1-64 Bytes
    # @attr [String] title Title of the result
    # @attr [Telegrammer::DataTypes::InputMessageContent] input_message_content Content of the message to be sent
    # @attr [Telegrammer::DataTypes::InlineKeyboardMarkup] reply_markup Optional. Inline keyboard attached to the message
    # @attr [String] url Optional. URL of the result
    # @attr [Boolean] hide_url Optional. Pass True, if you don't want the URL to be shown in the message
    # @attr [String] description Optional. Short description of the result
    # @attr [String] thumb_url Optional. Url of the thumbnail for the result
    # @attr [Integer] thumb_width Optional. Thumbnail width
    # @attr [Integer] thumb_height Optional. Thumbnail height
    #
    # See more at https://core.telegram.org/bots/api#inlinequeryresultarticle
    class InlineQueryResultArticle < Telegrammer::DataTypes::Base
      attribute :type, String, default: 'article'
      attribute :id, String
      attribute :title, String
      attribute :input_message_content, InputMessageContent
      attribute :reply_markup, InlineKeyboardMarkup
      attribute :url, String
      attribute :hide_url, Boolean
      attribute :description, String
      attribute :thumb_url, String
      attribute :thumb_width, Integer
      attribute :thumb_height, Integer
    end
  end
end
