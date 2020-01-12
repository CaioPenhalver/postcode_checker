# frozen_string_literal: true

require 'rails_helper'

feature 'Update district' do
  scenario 'successfully' do
    district = District.create(name: 'Lambeth')
    new_value = 'Southwark'

    visit edit_district_path(district.id)

    fill_in 'district_name', with: new_value

    click_on 'Update District'

    expect(page).to have_content new_value
  end

  scenario 'error' do
    district = District.create(name: 'Lambeth')
    new_value = ''

    visit edit_district_path(district.id)

    fill_in 'district_name', with: new_value

    click_on 'Update District'

    expect(page).to have_content 'Edit'
  end
end
