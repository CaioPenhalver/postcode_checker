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

      it 'create postcode' do
        expect(subject).to be_truthy
      end
    end

    context 'when it is not valid' do
      context 'postcode with wrong format' do
        let(:value) { 'SE17QAS' }

        it 'create postcode' do
          expect(subject).to be_falsey
        end
      end

      context 'postcode is already exist' do
        let(:value) { 'SE17QAS' }

        before { described_class.new(value: value).save }

        it 'create postcode' do
          expect(subject).to be_falsey
        end
      end
    end
  end
end
