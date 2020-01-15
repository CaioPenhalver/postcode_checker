# frozen_string_literal: true

# Responsible for holding the data that comes from http request
module Requests
  class Response
    attr_reader :body, :code, :messages

    def initialize(body, code, messages, success)
      @body = body
      @code = code
      @messages = messages
      @success = success
    end

    def success?
      @success
    end

    def to_hash
      return {} unless success? && body.present?

      @to_hash ||= Oj.load(body, symbol_keys: true)
    end
  end
end
