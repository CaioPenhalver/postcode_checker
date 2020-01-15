# frozen_string_literal: true

require 'rails_helper'

feature 'Create a new district' do
  scenario 'successfully' do
    visit new_district_path

    fill_in 'district_name', with: 'Lambeth'

    click_on 'Create District'

    expect(page).to have_content 'Lambeth'
  end

  scenario 'error' do
    visit new_district_path

    fill_in 'district_name', with: ''

    click_on 'Create District'

    expect(page).to have_content 'Register New District'
  end
end
