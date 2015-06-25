module Telegrammer
  module DataTypes
    class ForceReply < Telegrammer::DataTypes::Base
      attribute :force_reply, Boolean
      attribute :selective, Boolean
    end
  end
end
