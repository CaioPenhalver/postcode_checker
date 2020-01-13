# frozen_string_literal: true

class Whitelist::Response
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
