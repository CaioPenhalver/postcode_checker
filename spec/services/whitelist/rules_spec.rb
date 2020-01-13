# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Whitelist::Rules do
  describe '#run' do
    let(:postcode) { 'SH241AB' }

    subject do
      described_class.new(postcode).run
    end

    context 'when CheckPostcode is valid' do
      let(:check_postcode) { instance_double('CheckPostcode', execute: true) }

      it 'should return true' do
        expect(Whitelist::CheckPostcode).to receive(:new).with(postcode).and_return(check_postcode)

        expect(subject).to be_a Whitelist::Response
        expect(subject.postcode).to eq postcode
        expect(subject.source).to eq :postcode_whitelist
        expect(subject.available_postcode?).to be_truthy
      end
    end

    context 'when CheckLsoa is valid' do
      let(:check_postcode) { instance_double('CheckPostcode', execute: false) }
      let(:check_lsoa) { instance_double('CheckLsoa', execute: true) }

      it 'should return true' do
        expect(Whitelist::CheckPostcode).to receive(:new).with(postcode).and_return(check_postcode)
        expect(Whitelist::CheckLsoa).to receive(:new).with(postcode).and_return(check_lsoa)

        expect(subject).to be_a Whitelist::Response
        expect(subject.postcode).to eq postcode
        expect(subject.source).to eq :lsoa_whitelist
        expect(subject.available_postcode?).to be_truthy
      end
    end

    context 'when there is no rule valid' do
      let(:check_postcode) { instance_double('CheckPostcode', execute: false) }
      let(:check_lsoa) { instance_double('CheckLsoa', execute: false) }

      it 'should return true' do
        expect(Whitelist::CheckPostcode).to receive(:new).with(postcode).and_return(check_postcode)
        expect(Whitelist::CheckLsoa).to receive(:new).with(postcode).and_return(check_lsoa)

        expect(subject).to be_a Whitelist::Response
        expect(subject.postcode).to eq postcode
        expect(subject.source).to eq nil
        expect(subject.available_postcode?).to be_falsey
      end
    end
  end
end
