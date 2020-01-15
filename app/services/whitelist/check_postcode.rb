# frozen_string_literal: true

# It is a rule for checking if the zip code is in the service area requested
# It checks if the given postcode belongs to the postcode whitelist
module Whitelist
  class CheckPostcode
    attr_reader :postcode, :postcode_value

    def initialize(postcode_value, postcode = Postcode)
      @postcode = postcode
      @postcode_value = postcode_value
    end

    def execute
      postcode.find_by(value: postcode_value).present?
    end
  end
end
