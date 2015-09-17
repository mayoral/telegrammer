module Telegrammer
  class ApiResponse
    attr_reader :body
    attr_reader :result
    attr_reader :success

    def initialize(response,fail_silently = false)
      if response.status < 500
        @body = response.body

        data = MultiJson.load(@body)
        @success = data['ok']

        if @success
          @result = data['result']
        else
          if !fail_silently
            fail Telegrammer::Errors::BadRequestError, data['error_code'], data['description']
          end
        end
      else
        if !fail_silently
          fail Telegrammer::Errors::ServiceUnavailableError, response.status
        end
      end
    end

    alias_method :success?, :success
  end
end
