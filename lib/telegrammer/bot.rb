module Telegrammer
  # Wrapper for the Telegram's Bots API
  class Bot
    API_ENDPOINT = 'https://api.telegram.org'

    attr_reader :me

    # Returns a new instance of Telegrammer::Bot
    #
    # @param [String] api_token API Token
    #
    # @example
    #     bot = Telegrammer::Bot.new('[YOUR TELEGRAM TOKEN]')
    #
    # @raise [Telegrammer::Errors::BadRequestError] if something goes wrong obtaining data about your bot
    # @raise [Telegrammer::Errors::ServiceUnavailableError] if Telegram servers are down
    def initialize(api_token)
      @api_token = api_token
      @offset = 0
      @timeout = 60

      @me = get_me
    end

    # Get incoming updates using long polling
    #
    # @example
    #     bot = Telegrammer::Bot.new('[YOUR TELEGRAM TOKEN]')
    #
    #     bot.get_updates do |message|
    #       puts "In chat #{message.chat.id}, @#{message.from.username} said: #{message.text}"
    #       bot.send_message(chat_id: message.chat.id, text: "You said: #{message.text}")
    #
    #       # Here you can also process message text to detect user commands
    #       # To learn more about commands, see https://core.telegram.org/bots#commands
    #     end
    #
    # @raise [Telegrammer::Errors::BadRequestError] if something goes wrong in the Telegram API servers with the params received by the operation
    # @raise [Telegrammer::Errors::ServiceUnavailableError] if Telegram servers are down
    def get_updates(&block)
      loop do
        response = api_request("getUpdates", {offset: @offset, timeout: @timeout}, nil)

        response.result.each do |raw_update|
          update = Telegrammer::DataTypes::Update.new(raw_update)
          @offset = update.update_id + 1
          yield update.message
        end
      end
    end

    # Set a webhook where Telegram will send the messages received by your bot.
    #
    # @param [String] url
    #
    # @example
    #     bot = Telegrammer::Bot.new('[YOUR TELEGRAM TOKEN]')
    #
    #     # Set up a webhook
    #     bot.set_webhook("http://www.example.com/my/action")
    #
    #     # Delete a webhook
    #     bot.set_webhook("")
    #
    # @raise [Telegrammer::Errors::BadRequestError] if something goes wrong in the Telegram API servers with the params received by the operation
    # @raise [Telegrammer::Errors::ServiceUnavailableError] if Telegram servers are down
    #
    # @see https://github.com/mayoral/telegrammer/wiki/Using-webhooks
    # @return [Telegrammer::ApiResponse] Response from the API.
    def set_webhook(url)
      api_request("setWebhook", {url: url}, nil)
    end

    # Returns basic information about the bot in form of a User object. Used for testing your bot's auth token.
    #
    # @example
    #     bot = Telegrammer::Bot.new('[YOUR TELEGRAM TOKEN]')
    #     bot_user = bot.get_me
    #
    # @raise [Telegrammer::Errors::BadRequestError] if something goes wrong in the Telegram API servers with the params received by the operation
    # @raise [Telegrammer::Errors::ServiceUnavailableError] if Telegram servers are down
    #
    # @return [Telegrammer::DataTypes::User] User object with info about the bot
    def get_me
      response = api_request("getMe", nil, nil)

      Telegrammer::DataTypes::User.new(response.result)
    end

    # Send text messages to a user or group chat.
    #
    # @param [Hash] params hash of paramers to send to the sendMessage API operation.
    # @option params [Integer] :chat_id Required. Unique identifier for the message recipient — User or GroupChat id.
    # @option params [String] :text Required. Text of the message to be sent
    # @option params [Boolean] :disable_web_page_preview Optional. Disables link previews for links in this message
    # @option params [Integer] :reply_to_message_id Optional. If the message is a reply, ID of the original message
    # @option params [Telegrammer::DataTypes::ReplyKeyboardMarkup,Telegrammer::DataTypes::ReplyKeyboardHide,Telegrammer::DataTypes::ForceReply] :reply_markup Optional. Additional interface options. A JSON-serialized object for a custom reply keyboard, instructions to hide keyboard or to force a reply from the user.
    #
    # @example
    #     bot = Telegrammer::Bot.new('[YOUR TELEGRAM TOKEN]')
    #
    #     bot.send_message(
    #       chat_id: 123456789,
    #       text: "Hello World!"
    #     )
    #
    # @raise [Telegrammer::Errors::BadRequestError] if something goes wrong in the Telegram API servers with the params received by the operation
    # @raise [Telegrammer::Errors::ServiceUnavailableError] if Telegram servers are down
    #
    # @return [Telegrammer::DataTypes::Message] Message object sent to the user or group chat
    def send_message(params)
      params_validation = {
        chat_id: { required: true, class: [Fixnum] },
        text: { required: true, class: [String] },
        disable_web_page_preview: { required: false, class: [TrueClass, FalseClass] },
        reply_to_message_id: { required: false, class: [Fixnum] },
        reply_markup: { required: false, class: [
          Telegrammer::DataTypes::ReplyKeyboardMarkup,
          Telegrammer::DataTypes::ReplyKeyboardHide,
          Telegrammer::DataTypes::ForceReply,
        ]}
      }

      response = api_request("sendMessage", params, params_validation)

      Telegrammer::DataTypes::Message.new(response.result)
    end

    # Forward message to a user or group chat.
    #
    # @param [Hash] params hash of paramers to send to the forwardMessage API operation.
    # @option params [Integer] :chat_id Required. Unique identifier for the message recipient — User or GroupChat id.
    # @option params [Integer] :from_chat_id Required. Unique identifier for the chat where the original message was sent.
    # @option params [Integer] :message_id Required. Message id to be forwarded.
    #
    # @example
    #     bot = Telegrammer::Bot.new('[YOUR TELEGRAM TOKEN]')
    #
    #     bot.forward_message(
    #       chat_id: 123456789,
    #       from_chat_id: 987654321
    #       message_id: 111222333
    #     )
    #
    # @raise [Telegrammer::Errors::BadRequestError] if something goes wrong in the Telegram API servers with the params received by the operation
    # @raise [Telegrammer::Errors::ServiceUnavailableError] if Telegram servers are down
    #
    # @return [Telegrammer::DataTypes::Message] Message object sent to the user or group chat
    def forward_message(params)
      params_validation = {
        chat_id: { required: true, class: [Fixnum] },
        from_chat_id: { required: true, class: [String] },
        message_id: { required: true, class: [Fixnum] }
      }

      response = api_request("forwardMessage", params, params_validation)

      Telegrammer::DataTypes::Message.new(response.result)
    end

    # Sends a photo to a user or group chat.
    #
    # @param [Hash] params hash of paramers to send to the sendPhoto API operation.
    # @option params [Integer] :chat_id Required. Unique identifier for the message recipient — User or GroupChat id.
    # @option params [File,String] :photo Required.
    # @option params [String] :caption Optional.
    # @option params [Integer] :reply_to_message_id Optional. If the message is a reply, ID of the original message
    # @option params [Telegrammer::DataTypes::ReplyKeyboardMarkup,Telegrammer::DataTypes::ReplyKeyboardHide,Telegrammer::DataTypes::ForceReply] :reply_markup Optional. Additional interface options. A JSON-serialized object for a custom reply keyboard, instructions to hide keyboard or to force a reply from the user.
    #
    # @example
    #     bot = Telegrammer::Bot.new('[YOUR TELEGRAM TOKEN]')
    #     image_file = File.open("foo.jpg")
    #     bot.send_photo(chat_id: 123456789, photo: image_file)
    #
    # @raise [Telegrammer::Errors::BadRequestError] if something goes wrong in the Telegram API servers with the params received by the operation
    # @raise [Telegrammer::Errors::ServiceUnavailableError] if Telegram servers are down
    #
    # @see #send_document
    # @return [Telegrammer::DataTypes::Message] Message object sent to the user or group chat
    def send_photo(params)
      params_validation = {
        chat_id: { required: true, class: [Fixnum] },
        photo: { required: true, class: [File, String] },
        caption: { required: false, class: [String] },
        reply_to_message_id: { required: false, class: [String] },
        reply_markup: { required: false, class: [
          Telegrammer::DataTypes::ReplyKeyboardMarkup,
          Telegrammer::DataTypes::ReplyKeyboardHide,
          Telegrammer::DataTypes::ForceReply,
        ]}
      }

      response = api_request("sendPhoto", params, params_validation)

      Telegrammer::DataTypes::Message.new(response.result)
    end

    # Sends audio file to a user or group chat.
    #
    # At this moment, Telegram only allows Ogg files encoded with the OPUS codec. If you need to send another file format, you must use #send_document.
    #
    # @param [Hash] params hash of paramers to send to the sendAudio API operation.
    # @option params [Integer] :chat_id Required. Unique identifier for the message recipient — User or GroupChat id.
    # @option params [File,String] audio Required. Audio file to send. You can either pass a file_id as String to resend an audio that is already on the Telegram servers, or upload a new audio file using multipart/form-data
    # @option params [Integer] :reply_to_message_id Optional. If the message is a reply, ID of the original message
    # @option params [Telegrammer::DataTypes::ReplyKeyboardMarkup,Telegrammer::DataTypes::ReplyKeyboardHide,Telegrammer::DataTypes::ForceReply] :reply_markup Optional. Additional interface options. A JSON-serialized object for a custom reply keyboard, instructions to hide keyboard or to force a reply from the user.
    #
    # @example
    #     bot = Telegrammer::Bot.new('[YOUR TELEGRAM TOKEN]')
    #     audio_file = File.open("foo.ogg")
    #     bot.send_audio(chat_id: 123456789, audio: audio_file)
    #
    # @raise [Telegrammer::Errors::BadRequestError] if something goes wrong in the Telegram API servers with the params received by the operation
    # @raise [Telegrammer::Errors::ServiceUnavailableError] if Telegram servers are down
    #
    # @see #send_document
    # @return [Telegrammer::DataTypes::Message] Message object sent to the user or group chat
    def send_audio(params)
      params_validation = {
        chat_id: { required: true, class: [Fixnum] },
        audio: { required: true, class: [File, String] },
        reply_to_message_id: { required: false, class: [String] },
        reply_markup: { required: false, class: [
          Telegrammer::DataTypes::ReplyKeyboardMarkup,
          Telegrammer::DataTypes::ReplyKeyboardHide,
          Telegrammer::DataTypes::ForceReply,
        ]}
      }

      response = api_request("sendAudio", params, params_validation)

      Telegrammer::DataTypes::Message.new(response.result)
    end

    # Sends a document to a user or group chat.
    #
    # @param [Hash] params hash of paramers to send to the sendDocument API operation.
    # @option params [Integer] :chat_id Required. Unique identifier for the message recipient — User or GroupChat id.
    # @option params [File,String] :document Required. File to send. You can either pass a file_id as String to resend a file that is already on the Telegram servers, or upload a new file using multipart/form-data.
    # @option params [Integer] :reply_to_message_id Optional. If the message is a reply, ID of the original message
    # @option params [Telegrammer::DataTypes::ReplyKeyboardMarkup,Telegrammer::DataTypes::ReplyKeyboardHide,Telegrammer::DataTypes::ForceReply] :reply_markup Optional. Additional interface options. A JSON-serialized object for a custom reply keyboard, instructions to hide keyboard or to force a reply from the user.
    #
    # @example
    #     bot = Telegrammer::Bot.new('[YOUR TELEGRAM TOKEN]')
    #     my_secret_file = File.open("secrets.doc")
    #     bot.send_document(chat_id: 123456789, document: my_secret_file)
    #
    # @raise [Telegrammer::Errors::BadRequestError] if something goes wrong in the Telegram API servers with the params received by the operation
    # @raise [Telegrammer::Errors::ServiceUnavailableError] if Telegram servers are down
    #
    # @return [Telegrammer::DataTypes::Message] Message object sent to the user or group chat
    def send_document(params)
      params_validation = {
        chat_id: { required: true, class: [Fixnum] },
        document: { required: false, class: [File, String] },
        reply_to_message_id: { required: false, class: [String] },
        reply_markup: { required: false, class: [
          Telegrammer::DataTypes::ReplyKeyboardMarkup,
          Telegrammer::DataTypes::ReplyKeyboardHide,
          Telegrammer::DataTypes::ForceReply,
        ]}
      }

      response = api_request("sendDocument", params, params_validation)

      Telegrammer::DataTypes::Message.new(response.result)
    end

    # Send WebP images as stickers.
    #
    # @param [Hash] params hash of paramers to send to the sendSticker API operation.
    # @option params [Integer] :chat_id Required. Unique identifier for the message recipient — User or GroupChat id.
    # @option params [File,String] :sticker Required. Sticker to send. You can either pass a file_id as String to resend a file that is already on the Telegram servers, or upload a new file using multipart/form-data.
    # @option params [Integer] :reply_to_message_id Optional. If the message is a reply, ID of the original message
    # @option params [Telegrammer::DataTypes::ReplyKeyboardMarkup,Telegrammer::DataTypes::ReplyKeyboardHide,Telegrammer::DataTypes::ForceReply] :reply_markup Optional. Additional interface options. A JSON-serialized object for a custom reply keyboard, instructions to hide keyboard or to force a reply from the user.
    #
    # @example
    #     bot = Telegrammer::Bot.new('[YOUR TELEGRAM TOKEN]')
    #     sticker_file = File.open("my-sticker.webp")
    #     bot.send_sticker(chat_id: 123456789, sticker: sticker_file)
    #
    # @raise [Telegrammer::Errors::BadRequestError] if something goes wrong in the Telegram API servers with the params received by the operation
    # @raise [Telegrammer::Errors::ServiceUnavailableError] if Telegram servers are down
    #
    # @see #send_document
    # @return [Telegrammer::DataTypes::Message] Message object sent to the user or group chat
    def send_sticker(params)
      params_validation = {
        chat_id: { required: true, class: [Fixnum] },
        sticker: { required: true, class: [File, String] },
        reply_to_message_id: { required: false, class: [String] },
        reply_markup: { required: false, class: [
          Telegrammer::DataTypes::ReplyKeyboardMarkup,
          Telegrammer::DataTypes::ReplyKeyboardHide,
          Telegrammer::DataTypes::ForceReply,
        ]}
      }

      response = api_request("sendSticker", params, params_validation)

      Telegrammer::DataTypes::Message.new(response.result)
    end

    # Sends a video file to a user or group chat.
    #
    # At this moment, Telegram only support mp4 videos. If you need to send other formats you must use #send_document.
    #
    # @param [Hash] params hash of paramers to send to the sendVideo API operation.
    # @option params [Integer] :chat_id Required. Unique identifier for the message recipient — User or GroupChat id.
    # @option params [File,String] :video Video to send. You can either pass a file_id as String to resend a video that is already on the Telegram servers, or upload a new video file.
    # @option params [Integer] :reply_to_message_id Optional. If the message is a reply, ID of the original message
    # @option params [Telegrammer::DataTypes::ReplyKeyboardMarkup,Telegrammer::DataTypes::ReplyKeyboardHide,Telegrammer::DataTypes::ForceReply] :reply_markup Optional. Additional interface options. A JSON-serialized object for a custom reply keyboard, instructions to hide keyboard or to force a reply from the user.
    #
    # @example
    #     bot = Telegrammer::Bot.new('[YOUR TELEGRAM TOKEN]')
    #     my_video = File.open("foo.mp4")
    #     bot.send_video(chat_id: 123456789, video: my_video)
    #
    # @raise [Telegrammer::Errors::BadRequestError] if something goes wrong in the Telegram API servers with the params received by the operation
    # @raise [Telegrammer::Errors::ServiceUnavailableError] if Telegram servers are down
    #
    # @see #send_document
    # @return [Telegrammer::DataTypes::Message] Message object sent to the user or group chat
    def send_video(params)
      params_validation = {
        chat_id: { required: true, class: [Fixnum] },
        video: { required: true, class: [File, String] },
        reply_to_message_id: { required: false, class: [String] },
        reply_markup: { required: false, class: [
          Telegrammer::DataTypes::ReplyKeyboardMarkup,
          Telegrammer::DataTypes::ReplyKeyboardHide,
          Telegrammer::DataTypes::ForceReply,
        ]}
      }

      response = api_request("sendVideo", params, params_validation)

      Telegrammer::DataTypes::Message.new(response.result)
    end

    # Sends point on the map to a user or group chat.
    #
    # @param [Hash] params hash of paramers to send to the sendAudio API operation.
    # @option params [Integer] :chat_id Required. Unique identifier for the message recipient — User or GroupChat id.
    # @option params [Float] :latitude Required. Latitude of location.
    # @option params [Float] :longitude Required. Longitude of location.
    # @option params [Integer] :reply_to_message_id Optional. If the message is a reply, ID of the original message.
    # @option params [Telegrammer::DataTypes::ReplyKeyboardMarkup,Telegrammer::DataTypes::ReplyKeyboardHide,Telegrammer::DataTypes::ForceReply] :reply_markup Optional. Additional interface options. A JSON-serialized object for a custom reply keyboard, instructions to hide keyboard or to force a reply from the user.
    #
    # @example
    #     bot = Telegrammer::Bot.new('[YOUR TELEGRAM TOKEN]')
    #     bot.send_location(chat_id: 123456789, latitude: 38.775539, longitude: -4.829988)
    #
    # @raise [Telegrammer::Errors::BadRequestError] if something goes wrong in the Telegram API servers with the params received by the operation
    # @raise [Telegrammer::Errors::ServiceUnavailableError] if Telegram servers are down
    #
    # @return [Telegrammer::DataTypes::Message] Message object sent to the user or group chat
    def send_location(params)
      params_validation = {
        chat_id: { required: true, class: [Fixnum] },
        latitude: { required: true, class: [Float] },
        longitude: { required: true, class: [Float] },
        reply_to_message_id: { required: false, class: [String] },
        reply_markup: { required: false, class: [
          Telegrammer::DataTypes::ReplyKeyboardMarkup,
          Telegrammer::DataTypes::ReplyKeyboardHide,
          Telegrammer::DataTypes::ForceReply,
        ]}
      }

      response = api_request("sendLocation", params, params_validation)

      Telegrammer::DataTypes::Message.new(response.result)
    end

    # Sends a status action to a user or group chat.
    #
    # Used when you need to tell the user that something is happening on the bot's side. The status is set for 5 seconds or less (when a message arrives from your bot, Telegram clients clear its typing status).
    #
    # @param [Hash] params hash of paramers to send to the sendChatAction API operation.
    # @option params [Integer] :chat_id Required. Unique identifier for the message recipient — User or GroupChat id.
    # @option params [String] :action Required. Type of action to broadcast. Choose one, depending on what the user is about to receive: "typing" for text messages, "upload_photo" for photos, "record_video" or "upload_video" for videos, "record_audio" or "upload_audio" for audio files, "upload_document" for general files, "find_location" for location data.
    #
    # @example
    #     bot = Telegrammer::Bot.new('[YOUR TELEGRAM TOKEN]')
    #     bot.send_chat_action(chat_id: 123456789, action: "typing")
    #
    # @raise [Telegrammer::Errors::BadRequestError]
    # @raise [Telegrammer::Errors::ServiceUnavailableError] if Telegram servers are down
    #
    # @return [Telegrammer::ApiResponse] Response from the API.
    def send_chat_action(params)
      params_validation = {
        chat_id: { required: true, class: [Fixnum] },
        action: { required: true, class: [String] }
      }

      api_request("sendChatAction", params, params_validation)
    end

    # Get a list of profile pictures for a user.
    #
    # @param [Hash] params hash of paramers to send to the sendChatAction API operation.
    # @option params [Integer] :chat_id Required. Unique identifier of the target user.
    # @option params [Integer] :offset Optional. Sequential number of the first photo to be returned. By default, all photos are returned.
    # @option params [Integer] :limit Optional. Limits the number of photos to be retrieved. Values between 1—100 are accepted. Defaults to 100.
    #
    # @example
    #     bot = Telegrammer::Bot.new('[YOUR TELEGRAM TOKEN]')
    #     bot.get_user_profile_photos(user_id: 123456789)
    #
    # @raise [Telegrammer::Errors::BadRequestError]
    # @raise [Telegrammer::Errors::ServiceUnavailableError] if Telegram servers are down
    #
    # @return [Telegrammer::DataTypes::UserProfilePhotos] Message object sent to the user or group chat
    def get_user_profile_photos(params)
      params_validation = {
        user_id: { required: true, class: [Fixnum] },
        offset: { required: false, class: [Fixnum] },
        limit: { required: false, class: [Fixnum] }
      }

      response = api_request("getUserProfilePhotos", params, params_validation)

      Telegrammer::DataTypes::UserProfilePhotos.new(response.result)
    end

    private

    def api_request(action, params, params_validation)
      api_uri = "bot#{@api_token}/#{action}"

      if params_validation.nil?
        validated_params = params
      else
        # Delete params not accepted by the API
        validated_params = params.delete_if {|k, v| !params_validation.has_key?(k) }

        # Check all required params by the action are present
        params_validation.each do |key, value|
          if params_validation[key][:required] && !params.has_key?(key)
            raise Telegrammer::Errors::MissingParamsError.new(key, action)
          end
        end

        params.each do |key, value|
          # Check param types
          if !params_validation[key][:class].include?(value.class)
            raise Telegrammer::Errors::InvalidParamTypeError.new(key, value.class, params_validation[key][:class])
          end

          # Prepare params for sending in Typhoeus post body request
          params[key] = value.to_s if value.class == Fixnum
          params[key] = value.to_h.to_json if [
            Telegrammer::DataTypes::ReplyKeyboardMarkup,
            Telegrammer::DataTypes::ReplyKeyboardHide,
            Telegrammer::DataTypes::ForceReply
          ].include?(value.class)
        end
      end

      response = Typhoeus.post(
        "#{API_ENDPOINT}/#{api_uri}",
        body: validated_params,
        headers: {
          "User-Agent" => "Telegrammer/#{Telegrammer::VERSION}",
          "Accept" => "application/json"
        }
      )

      ApiResponse.new(response)
    end
  end
end
