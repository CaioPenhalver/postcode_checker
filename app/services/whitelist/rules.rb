# frozen_string_literal: true

class Whitelist::Rules
  RULES = {
    postcode_whitelist: Whitelist::CheckPostcode,
    lsoa_whitelist: Whitelist::CheckLsoa
  }.freeze

  def initialize(postcode)
    @postcode = postcode
  end

  def run
    rule = RULES.detect { |_name, rule| rule.new(postcode).execute }
    Whitelist::Response.new(postcode, rule&.first, rule.present?)
  end

  private

  attr_reader :postcode
end
