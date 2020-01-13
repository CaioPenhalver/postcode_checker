# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Requests::Request, type: :service do
  describe '#execute' do
    it 'should raise an error' do
      expect { described_class.new.execute }.to raise_error NotImplementedError
    end
  end

  describe '#options' do
    it 'should raise an error' do
      expect { described_class.new.options }.to raise_error NotImplementedError
    end
  end

  describe '#url' do
    it 'should raise an error' do
      expect { described_class.new.url }.to raise_error NotImplementedError
    end
  end

  describe '#host' do
    it 'should raise an error' do
      expect { described_class.new.host }.to raise_error NotImplementedError
    end
  end

  describe '#method' do
    it 'should raise an error' do
      expect { described_class.new.method }.to raise_error NotImplementedError
    end
  end

  describe '#path' do
    it 'should return nil' do
      expect(described_class.new.path).to be_nil
    end
  end

  describe '#headers' do
    it 'should return nil' do
      expect(described_class.new.headers).to be_nil
    end
  end

  describe '#params' do
    it 'should return nil' do
      expect(described_class.new.params).to be_nil
    end
  end

  describe '#body' do
    it 'should return nil' do
      expect(described_class.new.body).to be_nil
    end
  end

  describe '#response' do
    it 'should return nil' do
      expect(described_class.new.response).to be_nil
    end
  end
end
