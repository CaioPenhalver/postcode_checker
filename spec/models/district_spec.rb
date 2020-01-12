# frozen_string_literal: true

require 'rails_helper'

RSpec.describe District, type: :model do
  describe '#save' do
    subject { described_class.new(name: name).save }

    context 'when it saves successfully' do
      let(:name) { 'Lambeth' }

      it 'create postcode' do
        expect(subject).to be_truthy
      end
    end
  end

  describe '#valid?' do
    subject { described_class.new(name: name).valid? }

    context 'when it is valid' do
      let(:name) { 'Lambeth' }

      it 'should return true' do
        expect(subject).to be_truthy
      end
    end

    context 'when it is not valid' do
      context 'the string is empty' do
        let(:name) { '' }

        it 'should return false' do
          expect(subject).to be_falsey
        end
      end

      context 'the district already exist' do
        let(:name) { 'Lambeth' }

        before { described_class.new(name: name).save }

        it 'should return false' do
          expect(subject).to be_falsey
        end
      end

      context 'the value is nil' do
        let(:name) { nil }

        it 'should return false' do
          expect(subject).to be_falsey
        end
      end
    end

    describe '.ordered_by_update_date' do
      context 'when it is called without parameters' do
        context 'when there is only one page' do
          let!(:district_ids) { create_list(:district, 5).map(&:id) }

          it 'should return them ordered by update date' do
            districts = described_class.ordered_by_update_date

            expect(districts.first.id).to eq district_ids.last
            expect(districts.last.id).to eq district_ids.first
          end
        end

        context 'when there are more than one page' do
          before { create_list(:district, 12) }
          let(:expected_count_per_page) { 10 }
          let(:total_pages) { 2 }

          it 'should return them ordered by update date' do
            districts = described_class.ordered_by_update_date

            expect(districts.per_page).to eq expected_count_per_page
            expect(districts.total_pages).to eq total_pages
          end
        end
      end

      context 'when it is called passing parameters' do
        let!(:postcoe_ids) { create_list(:district, 12).map(&:id) }
        let(:per_page) { 4 }
        let(:total_pages) { 3 }
        let(:current_page) { 3 }

        it 'should return them ordered by update date' do
          districts = described_class
            .ordered_by_update_date(:asc,
                                    page: current_page,
                                    per_page: per_page)

          expect(districts.per_page).to eq per_page
          expect(districts.total_pages).to eq total_pages
          expect(districts.last.id).to eq postcoe_ids.last
        end
      end
    end
  end
end
