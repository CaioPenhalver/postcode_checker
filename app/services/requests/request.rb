# frozen_string_literal: true

# Abstract class. It's a wrapper for the Typhoeus request service
module Requests
  class Request
    def execute
      @http_response = Typhoeus::Request.new(url, options).run
      self
    end

    def options
      {
        method: method,
        body: body,
        params: params,
        headers: headers
      }.compact
    end

    def url
      "#{host}#{path}"
    end

    def host
      raise NotImplementedError
    end

    def method
      raise NotImplementedError
    end

    def path
      nil
    end

    def headers
      nil
    end

    def params
      nil
    end

    def body
      nil
    end

    def response
      return if http_response.nil?

      Requests::Response.new(http_response.body,
                             http_response.code,
                             http_response.return_message,
                             http_response.success?)
    end

    private

    attr_reader :http_response
  end
end
