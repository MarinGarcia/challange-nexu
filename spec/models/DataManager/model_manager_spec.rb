require 'rails_helper'

RSpec.describe DataManager::ModelManager do
  describe 'Static Methods' do
    it 'Create register should be return true' do
      params = '{"name":"test", "average_price": "406400"}'
      brand_id = 1
      response = described_class.create_register(brand_id, params)
      expect(response).to have_key(:status)
      expect(response[:status]).to be true
    end

    it 'Create register should be return false when data is incorrect' do
      params = '{"wrong": "wrong}'
      brand_id = 1
      response = described_class.create_register(brand_id, params)
      expect(response).to have_key(:status)
      expect(response[:status]).to be false
    end

    it 'Create register should be return false when brand id not exists' do
      params = '{"name":"test", "average_price": "406400"}'
      brand_id = 0
      response = described_class.create_register(brand_id, params)
      expect(response).to have_key(:status)
      expect(response[:status]).to be false
    end

    it 'Create register should be return false when model exists' do
      params = '{"name":"ILX", "average_price": "406400"}'
      brand_id = 1
      response = described_class.create_register(brand_id, params)
      expect(response).to have_key(:status)
      expect(response[:status]).to be false
      expect(response[:message]).to eq('Model already exists')
    end
  end
end
