# frozen_string_literal: true

require 'rails_helper'

feature 'Update postcode' do
  scenario 'successfully' do
    postcode = Postcode.create(value: 'SE17QD')
    new_value = 'SE17QA'
    visit edit_postcode_path(postcode.id)

    fill_in 'postcode_value', with: new_value

    click_on 'Update Postcode'

    expect(page).to have_content new_value
  end

  scenario 'error' do
    postcode = Postcode.create(value: 'SE17QD')
    new_value = 'SE18767QA'
    visit edit_postcode_path(postcode.id)

    fill_in 'postcode_value', with: new_value

    click_on 'Update Postcode'

    expect(page).to have_content 'Edit Postcode'
  end
end
