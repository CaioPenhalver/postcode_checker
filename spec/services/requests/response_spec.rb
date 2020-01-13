# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Requests::Response, type: :service do
  let(:body) { '{ "some_key": "any value" }' }
  let(:code) { 201 }
  let(:messages) { 'Any kind of message' }
  let(:success) { true }

  subject do
    described_class.new(body, code, messages, success)
  end

  describe '#body' do
    it 'should return body' do
      expect(subject.body).to eq body
    end
  end

  describe '#code' do
    it 'should return body' do
      expect(subject.code).to eq code
    end
  end

  describe '#messages' do
    it 'should return body' do
      expect(subject.messages).to eq messages
    end
  end

  describe '#success?' do
    it 'should return body' do
      expect(subject.success?).to be success
    end
  end

  describe '#to_hash' do
    it 'should return body' do
      expect(subject.to_hash).to eq(some_key: 'any value')
    end
  end
end
