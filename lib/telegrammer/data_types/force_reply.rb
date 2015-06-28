module Telegrammer
  module DataTypes
    # Telegram ForceReply data type
    #
    # @attr [Boolean] force_reply Shows reply interface to the user, as if they manually selected the bot‘s message and tapped ’Reply'
    # @attr [Boolean] selective Optional. Use this parameter if you want to force reply from specific users only. Targets: 1) users that are @mentioned in the text of the Message object; 2) if the bot's message is a reply (has reply_to_message_id), sender of the original message.
    #
    # See more at https://core.telegram.org/bots/api#forcereply
    class ForceReply < Telegrammer::DataTypes::Base
      attribute :force_reply, Boolean, default: true
      attribute :selective, Boolean, default: false
    end
  end
end
