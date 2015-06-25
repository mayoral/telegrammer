module Telegrammer
  module DataTypes
    class Message < Telegrammer::DataTypes::Base
      attribute :message_id, Integer
      attribute :from, User
      attribute :date, DateTime
      attribute :chat, Channel
      attribute :forward_from, User
      attribute :forward_date, Integer
      attribute :reply_to_message, Message
      attribute :text, String
      attribute :audio, Audio
      attribute :document, Document
      attribute :photo, Array[PhotoSize]
      attribute :sticker, Sticker
      attribute :video, Video
      attribute :contact, Contact
      attribute :location, Location
      attribute :new_chat_participant, User
      attribute :left_chat_participant, User
      attribute :new_chat_title, String
      attribute :new_chat_photo, String
      attribute :delete_chat_photo, Boolean
      attribute :group_chat_created, Boolean
    end
  end
end
