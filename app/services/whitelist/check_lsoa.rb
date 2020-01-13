# frozen_string_literal: true

class Whitelist::CheckLsoa
  attr_reader :district, :postcode_value

  def initialize(district = District, postcode_value)
    @postcode_value = postcode_value
    @district = district
  end

  def execute
    response = Requests::FindPostcode.new(postcode_value).execute.response
    return false unless response.success?

    district_name = get_district_name(response)
    district.find_by(name: district_name).present?
  end

  private

  def get_district_name(response)
    response.to_hash.dig(:result, :lsoa).split.first
  end
end
