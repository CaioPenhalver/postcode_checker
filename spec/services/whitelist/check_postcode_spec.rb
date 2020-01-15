# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Whitelist::CheckPostcode do
  let(:postcode_class) { double('Postcode', find_by: postcode) }
  let(:postcode_value) { 'SH241AB' }

  subject do
    described_class.new(postcode_value, postcode_class)
  end

  describe '#execute' do
    let(:postcode) { instance_double('Postcode') }

    context 'when postcode belongs to postcode whitelist' do
      it 'should return true' do
        expect(postcode_class).to receive(:find_by).with(value: postcode_value)
        expect(subject.execute).to be_truthy
      end
    end

    context 'when postcode belongs to postcode whitelist' do
      let(:postcode) { nil }

      it 'should return false' do
        expect(postcode_class).to receive(:find_by).with(value: postcode_value)
        expect(subject.execute).to be_falsy
      end
    end
  end
end
