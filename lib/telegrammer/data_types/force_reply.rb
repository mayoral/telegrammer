module Telegrammer
  module DataTypes
    class ForceReply < Telegrammer::DataTypes::Base
      attribute :force_reply, Boolean, default: true
      attribute :selective, Boolean, default: false
    end
  end
end
