# frozen_string_literal: true

# class that contains the rules to check the given postcode
module Whitelist
  class Rules
    RULES = {
      postcode_whitelist: Whitelist::CheckPostcode,
      lsoa_whitelist: Whitelist::CheckLsoa
    }.freeze

    def initialize(postcode)
      @postcode = postcode
    end

    def run
      response = RULES.detect { |_name, rule| rule.new(postcode).execute }
      Whitelist::Response.new(postcode, response&.first, response.present?)
    end

    private

    attr_reader :postcode
  end
end
