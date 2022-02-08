require 'rails_helper'

describe 'Merchants API endpoints' do
  describe 'GET merchants' do
    before(:each) do
      create_list(:merchant, 3)
      get '/api/v1/merchants'
    end
    let!(:merchants) {JSON.parse(response.body, symbolize_names: true)}

    it 'returns successful' do
      expect(response).to be_successful
    end
    it 'returns correct number of objects' do
      expect(merchants[:data].count).to eq(3)
    end
    it 'returns correct info for each object' do
      merchants[:data].each do |merchant|
        expect(merchant).to have_key(:id)
        expect(merchant[:id]).to be_a(String)

        expect(merchant).to have_key(:attributes)
        expect(merchant[:attributes]).to be_a(Hash)

        expect(merchant[:attributes]).to have_key(:name)
        expect(merchant[:attributes][:name]).to be_a(String)
      end
    end
  end

  describe 'GET merchant' do
    before(:each) do
      merchant_1 = FactoryBot.create(:merchant)
      get "/api/v1/merchants/#{merchant_1.id}"
    end
    let!(:merchant_1) {JSON.parse(response.body, symbolize_names: true)}

    it 'returns successful' do
      expect(response).to be_successful
    end
    it 'returns correct info' do
      expect(merchant_1).to have_key(:data)
      expect(merchant_1[:data]).to be_a(Hash)

      expect(merchant_1[:data]).to have_key(:id)
      expect(merchant_1[:data][:id]).to be_a(String)

      expect(merchant_1[:data]).to have_key(:type)
      expect(merchant_1[:data][:type]).to eq('merchant')

      expect(merchant_1[:data]).to have_key(:attributes)
      expect(merchant_1[:data][:attributes]).to be_a(Hash)

      expect(merchant_1[:data][:attributes]).to have_key(:name)
      expect(merchant_1[:data][:attributes][:name]).to be_a(String)
    end

    it 'returns a status 404 if merchant ID invalid' do
      get "/api/v1/merchants/158198468461"
      expect(response.status).to eq(404)
    end
  end
end
