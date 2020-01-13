# frozen_string_literal: true

class WhitelistService
  def initialize(rules = Whitelist::Rules)
    @rules = rules
  end

  def available_postcode(postcode_value)
    value = normalized_value(postcode_value)
    rules.new(value).run
  end

  private

  attr_reader :rules

  def normalized_value(postcode_value)
    postcode_value.upcase.gsub(/ /, '')
  end
end
