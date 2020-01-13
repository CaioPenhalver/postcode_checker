# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WhitelistService, type: :service do
  describe '#available_postcode' do
    let(:rules_class) { double('Rules', new: rules) }
    let(:rules) { instance_double('Rules', run: 'Response') }
    let(:postcode) { 'sH2 41Ab' }
    let(:normalized_postcode) { 'SH241AB' }

    subject do
      described_class.new(rules_class).available_postcode(postcode)
    end

    it 'should run the rules' do
      expect(rules_class).to receive(:new).with(normalized_postcode)
      expect(subject).to eq 'Response'
    end
  end
end
