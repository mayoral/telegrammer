module Telegrammer
  module DataTypes
    # Telegram Message data type
    #
    # @attr [Integer] message_id Unique message identifier
    # @attr [Telegrammer::DataTypes::User] from Sender
    # @attr [DateTime] date Date the message was sent
    # @attr [Telegrammer::DataTypes::Chat] chat Conversation the message belongs to
    # @attr [Telegrammer::DataTypes::User] forward_from Optional. For forwarded messages, sender of the original message
    # @attr [DateTime] forward_date Optional. For forwarded messages, date the original message was sent
    # @attr [Telegrammer::DataTypes::Message] reply_to_message Optional. For replies, the original message. Note that the Message object in this field will not contain further reply_to_message fields even if it itself is a reply.
    # @attr [String] text Optional. For text messages, the actual UTF-8 text of the message
    # @attr [Telegrammer::DataTypes::Audio] audio Optional. Message is an audio file, information about the file
    # @attr [Telegrammer::DataTypes::Document] document Optional. Message is a general file, information about the file
    # @attr [Telegrammer::DataTypes::PhotoSize] photo Optional. Message is a photo, available sizes of the photo
    # @attr [Telegrammer::DataTypes::Sticker] sticker Optional. Message is a sticker, information about the sticker
    # @attr [Telegrammer::DataTypes::Video] video Optional. Message is a video, information about the video
    # @attr [Telegrammer::DataTypes::Voice] voice Optional. Message is a voice message, information about the file
    # @attr [String] caption Optional. Caption for the photo or video
    # @attr [Telegrammer::DataTypes::Contact] contact Optional. Message is a shared contact, information about the contact
    # @attr [Telegrammer::DataTypes::Location] location Optional. Message is a shared location, information about the location
    # @attr [Telegrammer::DataTypes::User] new_chat_participant Optional. A new member was added to the group, information about them (this member may be bot itself)
    # @attr [Telegrammer::DataTypes::User] left_chat_participant Optional. A member was removed from the group, information about them (this member may be bot itself)
    # @attr [String] new_chat_title Optional. A group title was changed to this value
    # @attr [Telegrammer::DataTypes::PhotoSize] new_chat_photo Optional. A group photo was change to this value
    # @attr [Boolean] delete_chat_photo Optional. Informs that the group photo was deleted
    # @attr [Boolean] group_chat_created Optional. Informs that the group has been created
    # @attr [Boolean] supergroup_chat_created Optional. Service message: the supergroup has been created
    # @attr [Boolean] channel_chat_created Optional. Service message: the channel has been created
    # @attr [Integer] migrate_to_chat_id Optional. The group has been migrated to a supergroup with the specified identifier, not exceeding 1e13 by absolute value
    # @attr [Integer] migrate_from_chat_id Optional. The supergroup has been migrated from a group with the specified identifier, not exceeding 1e13 by absolute value
    #
    # See more at https://core.telegram.org/bots/api#message
    class Message < Telegrammer::DataTypes::Base
      attribute :message_id, Integer
      attribute :from, User
      attribute :date, DateTime
      attribute :chat, Chat
      attribute :forward_from, User
      attribute :forward_date, DateTime
      attribute :reply_to_message, Message
      attribute :text, String
      attribute :audio, Audio
      attribute :document, Document
      attribute :photo, Array[PhotoSize]
      attribute :sticker, Sticker
      attribute :video, Video
      attribute :voice, Voice
      attribute :contact, Contact
      attribute :location, Location
      attribute :new_chat_participant, User
      attribute :left_chat_participant, User
      attribute :new_chat_title, String
      attribute :new_chat_photo, Array[PhotoSize]
      attribute :delete_chat_photo, Boolean
      attribute :group_chat_created, Boolean
      attribute :supergroup_chat_created, Boolean
      attribute :channel_chat_created, Boolean
      attribute :migrate_from_chat_id, Integer
      attribute :migrate_to_chat_id, Integer
    end
  end
end
