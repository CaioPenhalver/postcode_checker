# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Whitelist::CheckLsoa do
  let(:district_class) { double('District', find_by: district) }
  let(:response) do
    instance_double('Request', success?: true,
                               to_hash: { result: { lsoa: 'Southwark 034A' } })
  end
  let(:find_postcode_request) { instance_double('FindPostcode', execute: self, response: response) }
  let(:postcode) { 'SH241AB' }
  let(:district_name) { 'Southwark' }

  subject do
    described_class.new(postcode, district_class)
  end

  describe '#execute' do
    context 'when postcode belongs to lsoa whitelist' do
      let(:district) { instance_double('District') }

      it 'should return true' do
        expect(Requests::FindPostcode).to receive(:new).with(postcode)
                                                       .and_return(find_postcode_request)
        expect(district_class).to receive(:find_by).with(name: district_name)
        expect(subject.execute).to be_truthy
      end
    end

    context 'when postcode does not belongs to lsoa whitelist' do
      let(:district) { nil }

      it 'should return false' do
        expect(Requests::FindPostcode).to receive(:new).with(postcode)
                                                       .and_return(find_postcode_request)
        expect(district_class).to receive(:find_by).with(name: district_name)
        expect(subject.execute).to be_falsy
      end
    end
  end
end
