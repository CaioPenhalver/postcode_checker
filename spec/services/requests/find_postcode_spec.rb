# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Requests::FindPostcode, type: :service do
  let(:postcode) { 'SE17QD' }
  let(:options) { { method: :get } }
  let(:host) { ExternalApis.postcode }
  let(:path) { "/postcodes/#{postcode}" }
  let(:url) { "#{host}#{path}" }
  let(:request) { instance_double('Request', run: response) }
  let(:response) do
    instance_double('Request', body: 'body',
                               code: 200,
                               return_message: nil,
                               success?: true)
  end

  subject do
    described_class.new(postcode)
  end

  describe '#execute' do
    it 'should call method to run request and return self' do
      expect(Typhoeus::Request).to receive(:new)
        .with(url, options)
        .and_return(request)
      expect(request).to receive(:run)
      expect(subject.execute).to be_a Requests::FindPostcode
    end
  end

  describe '#options' do
    it 'should return available options' do
      expect(subject.options).to eq options
    end
  end

  describe '#url' do
    it 'should return url' do
      expect(subject.url).to eq url
    end
  end

  describe '#host' do
    it 'should return host' do
      expect(subject.host).to eq host
    end
  end

  describe '#method' do
    it 'should return http method' do
      expect(subject.method).to eq :get
    end
  end

  describe '#path' do
    it 'should path' do
      expect(subject.path).to eq path
    end
  end

  describe '#response' do
    it 'should create response with the right attributes' do
      allow(Typhoeus::Request).to receive(:new)
        .with(url, options)
        .and_return(request)
      expect(Requests::Response).to receive(:new)
        .with(response.body, response.code, response.return_message, response.success?)
        .and_call_original
      expect(subject.execute.response).to be_a Requests::Response
    end
  end
end
