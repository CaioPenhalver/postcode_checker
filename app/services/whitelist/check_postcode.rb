# frozen_string_literal: true

class Whitelist::CheckPostcode
  attr_reader :postcode, :postcode_value

  def initialize(postcode = Postcode, postcode_value)
    @postcode = postcode
    @postcode_value = postcode_value
  end

  def execute
    postcode.find_by(value: postcode_value).present?
  end
end
