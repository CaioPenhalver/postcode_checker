# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Postcode, type: :model do
  describe '#save' do
    subject { described_class.new(value: value).save }

    context 'when it saves successfully' do
      let(:value) { 'SE17QA' }

      it 'create postcode' do
        expect(subject).to be_truthy
      end
    end
  end

  describe '#valid?' do
    subject { described_class.new(value: value).valid? }

    context 'when it is valid' do
      let(:value) { 'SE17QA' }

      it 'should return true' do
        expect(subject).to be_truthy
      end
    end

    context 'when it is not valid' do
      context 'postcode with wrong format' do
        let(:value) { 'SE17QAS' }

        it 'should return false' do
          expect(subject).to be_falsey
        end
      end

      context 'postcode is already exist' do
        let(:value) { 'SE17QAS' }

        before { described_class.new(value: value).save }

        it 'should return false' do
          expect(subject).to be_falsey
        end
      end
    end
  end

  describe '.ordered_by_update_date' do
    context 'when it is called without parameters' do
      context 'when there is only one page' do
        let!(:postcode_ids) { create_list(:postcode, 5).map(&:id) }

        it 'should return them ordered by update date' do
          postcodes = described_class.ordered_by_update_date

          expect(postcodes.first.id).to eq postcode_ids.last
          expect(postcodes.last.id).to eq postcode_ids.first
        end
      end

      context 'when there are more than one page' do
        before { create_list(:postcode, 12) }
        let(:expected_count_per_page) { 10 }
        let(:total_pages) { 2 }

        it 'should return them ordered by update date' do
          postcodes = described_class.ordered_by_update_date

          expect(postcodes.per_page).to eq expected_count_per_page
          expect(postcodes.total_pages).to eq total_pages
        end
      end
    end

    context 'when it is called passing parameters' do
      let!(:postcoe_ids) { create_list(:postcode, 12).map(&:id) }
      let(:per_page) { 4 }
      let(:total_pages) { 3 }
      let(:current_page) { 3 }

      it 'should return them ordered by update date' do
        postcodes = described_class
          .ordered_by_update_date(:asc,
                                  page: current_page,
                                  per_page: per_page)

        expect(postcodes.per_page).to eq per_page
        expect(postcodes.total_pages).to eq total_pages
        expect(postcodes.last.id).to eq postcoe_ids.last
      end
    end
  end
end
