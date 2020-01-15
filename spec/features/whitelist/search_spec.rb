# frozen_string_literal: true

require 'rails_helper'

feature 'Check if postcode is in the service area' do
  scenario 'postcode is in the lsoa whitelist' do
    district = 'Southwark'
    postcode = 'SE17QD'
    status = 200
    response = { status: status, result: { lsoa: "#{district} 034A" } }.to_json
    url = "#{ExternalApis.postcode}/postcodes/#{postcode}"

    stub_request(:get, url).to_return(body: response, status: status)
    create(:district, name: district)

    visit whitelist_index_path

    fill_in 'Postcode', with: postcode

    click_on 'Search'

    expect(page).to have_content postcode
    expect(page).to have_content 'lsoa_whitelist'
  end

  scenario 'postcode is in the postcode whitelist' do
    postcode = 'SE17QD'

    create(:postcode, value: postcode)

    visit whitelist_index_path

    fill_in 'Postcode', with: postcode

    click_on 'Search'

    expect(page).to have_content postcode
    expect(page).to have_content 'postcode_whitelist'
  end

  scenario 'postcode is not in service area' do
    district = 'Southwark'
    not_found_postcode = 'SF87AB'
    status = 404
    response = { status: status, result: { lsoa: "#{district} 034A" } }.to_json
    url = "#{ExternalApis.postcode}/postcodes/#{not_found_postcode}"

    stub_request(:get, url).to_return(body: response, status: status)
    create(:district, name: district)
    create(:postcode, value: 'SE17QD')

    visit whitelist_index_path

    fill_in 'Postcode', with: not_found_postcode

    click_on 'Search'

    expect(page).to have_content not_found_postcode
  end
end
