# frozen_string_literal: true

require 'rails_helper'

feature 'List postcodes' do
  scenario 'successfully' do
    postcodes = create_list(:postcode, 3)

    visit postcodes_path


    postcodes.each do |postcode|
      expect(page).to have_content postcode.value
    end
  end

  scenario 'paginate successfully' do
    postcodes = create_list(:postcode, 20)
    second_page = postcodes[0..9]
    first_page = postcodes[10..19]

    visit postcodes_path

    within('div.pagination') do
      click_on 'Next'
    end

    first_page.each do |postcode|
      expect(page).to_not have_content postcode.value
    end

    second_page.each do |postcode|
      expect(page).to have_content postcode.value
    end
  end
end
