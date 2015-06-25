require 'typhoeus'
require 'virtus'
require 'multi_json'

require "telegrammer/version"

require "telegrammer/data_types/base"
require "telegrammer/data_types/audio"
require "telegrammer/data_types/channel"
require "telegrammer/data_types/contact"
require "telegrammer/data_types/photo_size"
require "telegrammer/data_types/user"
require "telegrammer/data_types/sticker"
require "telegrammer/data_types/video"

require "telegrammer/data_types/document"
require "telegrammer/data_types/force_reply"
require "telegrammer/data_types/group_chat"
require "telegrammer/data_types/location"
require "telegrammer/data_types/message"
require "telegrammer/data_types/reply_keyboard_hide"
require "telegrammer/data_types/reply_keyboard_markup"
require "telegrammer/data_types/update"
require "telegrammer/data_types/user_profile_photos"

require "telegrammer/bot"
require "telegrammer/api_response"

module Telegrammer
  module Errors
    class MissingParamsError < StandardError
      def initialize(parameter, action)
        super("Missing parameter #{parameter} for action #{action}")
      end
    end

    class InvalidParamTypeError < StandardError
      def initialize(parameter, current_type, allowed_types)
        super("Invalid parameter type: #{parameter}: #{current_type}. Allowed types: #{allowed_types.each {|type| type.class.to_s }.join(",")}.")
      end
    end

    class BadRequestError < StandardError
      def initialize(error_code, message)
        super("Bad request. Error code: #{error_code} - Message: #{message}")
      end
    end
  end
end
