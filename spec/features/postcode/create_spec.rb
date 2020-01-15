# frozen_string_literal: true

require 'rails_helper'

feature 'Create a new postcode' do
  scenario 'successfully' do
    visit new_postcode_path

    fill_in 'postcode_value', with: 'SE17QD'

    click_on 'Create Postcode'

    expect(page).to have_content 'SE17QD'
  end

  scenario 'error' do
    visit new_postcode_path

    fill_in 'postcode_value', with: 'SE1uy7QD'

    click_on 'Create Postcode'

    expect(page).to have_content 'Register New Postcode'
  end
end
