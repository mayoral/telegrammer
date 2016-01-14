require 'httpclient'
require 'virtus'
require 'multi_json'

require 'telegrammer/version'

require 'telegrammer/data_types/photo_array'
require 'telegrammer/data_types/base'
require 'telegrammer/data_types/audio'
require 'telegrammer/data_types/chat'
require 'telegrammer/data_types/contact'
require 'telegrammer/data_types/photo_size'
require 'telegrammer/data_types/user'
require 'telegrammer/data_types/sticker'
require 'telegrammer/data_types/video'
require 'telegrammer/data_types/voice'

require 'telegrammer/data_types/chosen_inline_result'
require 'telegrammer/data_types/inline_query'
require 'telegrammer/data_types/inline_query_result_article'
require 'telegrammer/data_types/inline_query_result_gif'
require 'telegrammer/data_types/inline_query_result_mpeg4_gif'
require 'telegrammer/data_types/inline_query_result_photo'
require 'telegrammer/data_types/inline_query_result_video'

require 'telegrammer/data_types/document'
require 'telegrammer/data_types/file'
require 'telegrammer/data_types/force_reply'
require 'telegrammer/data_types/group_chat'
require 'telegrammer/data_types/location'
require 'telegrammer/data_types/message'
require 'telegrammer/data_types/reply_keyboard_hide'
require 'telegrammer/data_types/reply_keyboard_markup'
require 'telegrammer/data_types/update'
require 'telegrammer/data_types/user_profile_photos'

require 'telegrammer/bot'
require 'telegrammer/api_response'

module Telegrammer
  module Errors
    # Error returned when a required param is missing
    class MissingParamsError < StandardError
      def initialize(parameter, action)
        super("Missing parameter #{parameter} for action #{action}")
      end
    end

    # Error returned when a param type is invalid
    class InvalidParamTypeError < StandardError
      def initialize(parameter, current_type, allowed_types)
        super("Invalid parameter type: #{parameter}: #{current_type}. Allowed types: #{allowed_types.each { |type| type.class.to_s }.join(',')}.")
      end
    end

    # Error returned when something goes bad with your request to the Telegram API
    class BadRequestError < StandardError
      def initialize(error_code, message)
        super("Bad request. Error code: #{error_code} - Message: #{message}")
      end
    end

    # Error returned when Telegram API Service is unavailable
    class ServiceUnavailableError < StandardError
      def initialize(status_code)
        super("Telegram API Service unavailable (HTTP error code #{status_code})")
      end
    end

    # Error returned when HTTPClient raise a timeout (?)
    class TimeoutError < StandardError
      def initialize(message)
        super("Timeout reached. Message: #{message}")
      end
    end
  end
end
