# frozen_string_literal: true

require 'rails_helper'

feature 'List districts' do
  scenario 'successfully' do
    districts = create_list(:district, 3)

    visit districts_path

    districts.each do |district|
      expect(page).to have_content district.name
    end
  end

  scenario 'paginate successfully' do
    districts = create_list(:district, 20)
    second_page = districts[0..9]
    first_page = districts[10..19]

    visit districts_path

    within('div.pagination') do
      click_on 'Next'
    end

    first_page.each do |district|
      expect(page).to_not have_content district.name
    end

    second_page.each do |district|
      expect(page).to have_content district.name
    end
  end
end
