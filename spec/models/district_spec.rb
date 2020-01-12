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
  end
end
