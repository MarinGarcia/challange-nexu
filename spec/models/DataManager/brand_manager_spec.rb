require 'rails_helper'

RSpec.describe DataManager::BrandManager do
  describe 'Static Methods' do
    it 'list with average prices' do
      brands = Brand.all
      response = described_class.list_with_avarage_prices(brands)
      expect(response).to have_key(:status)
      expect(response[:status]).to be true
      expect(response[:data]).to be_an_instance_of(Array)
    end

    it 'list models' do
      brand_id = Brand.first.id
      response = described_class.list_models(brand_id.to_s)
      expect(response).to have_key(:status)
      expect(response[:status]).to be true
      expect(response[:data]).not_to be_empty
    end

    it 'create register should be true' do
      params = '{"name":"Toyota"}'
      response = described_class.create_register(params)
      expect(response).to have_key(:status)
      expect(response[:status]).to be true
    end

    it 'create register should be false when data is incorrect' do
      params = '{"incorrect_atribute":"Toyota"}'
      response = described_class.create_register(params)
      expect(response).to have_key(:status)
      expect(response).to have_key(:message)
      expect(response[:status]).to be false
    end
  end
end
