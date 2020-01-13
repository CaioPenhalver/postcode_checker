# frozen_string_literal: true

class Requests::FindPostcode < Requests::Request
  attr_reader :postcode

  def initialize(postcode)
    @postcode = postcode
  end

  def host
    ExternalApis.postcode
  end

  def path
    "/postcodes/#{postcode}"
  end

  def method
    :get
  end
end
