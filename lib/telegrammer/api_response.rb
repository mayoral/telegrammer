module Telegrammer
  class ApiResponse
    attr_reader :body
    attr_reader :result
    attr_reader :success

    def initialize(response)
      if response.status < 500
        @body = response.body

        data = MultiJson.load(@body)
        @success = data['ok']

        if @success
          @result = data['result']
        else
          fail Telegrammer::Errors::BadRequestError, data['error_code'], data['description']
        end
      else
        fail Telegrammer::Errors::ServiceUnavailableError, response.status
      end
    end

    alias_method :success?, :success
  end
end
