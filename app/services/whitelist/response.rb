# frozen_string_literal: true

# Response with the info provided by the rules
module Whitelist
  class Response
    attr_reader :postcode, :source

    def initialize(postcode, source, available_postcode)
      @postcode = postcode
      @source = source
      @available_postcode = available_postcode
    end

    def available_postcode?
      @available_postcode
    end
  end
end
