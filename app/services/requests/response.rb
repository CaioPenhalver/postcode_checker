# frozen_string_literal: true

class Requests::Response
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

    @hash_obj ||= Oj.load(body, symbol_keys: true)
  end
end
