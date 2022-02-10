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
      merchant_1 = create(:merchant)
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

  describe 'GET merchant items' do
    before(:each) do
      merchant_1 = create(:merchant)
      create_list(:item, 3, merchant_id: merchant_1.id)
      get "/api/v1/merchants/#{merchant_1.id}/items"
    end
    let!(:items) {JSON.parse(response.body, symbolize_names: true)}

    it 'returns successful' do
      expect(response).to be_successful
    end
    it 'returns correct info' do
      expect(items).to have_key(:data)
      expect(items[:data]).to be_an(Array)

      expect(items[:data].count).to eq(3)

      items[:data].each do |item|
        expect(item).to have_key(:id)
        expect(item[:id]).to be_a(String)

        expect(item).to have_key(:type)
        expect(item[:type]).to eq('item')

        expect(item).to have_key(:attributes)
        expect(item[:attributes]).to be_a(Hash)

        attributes = item[:attributes]
        expect(attributes).to have_key(:name)
        expect(attributes[:name]).to be_a(String)

        expect(attributes).to have_key(:description)
        expect(attributes[:description]).to be_a(String)

        expect(attributes).to have_key(:unit_price)
        expect(attributes[:unit_price]).to be_a(Float)

        expect(attributes).to have_key(:merchant_id)
        expect(attributes[:merchant_id]).to be_an(Integer)
      end
    end
  end

  describe 'GET merchant search by name' do
    before(:each) do
      merchant_1 = create(:merchant, name: "Observe")
      merchant_2 = create(:merchant, name: "Preserve")
      merchant_3 = create(:merchant, name: "Deserve")
      merchant_4 = create(:merchant, name: "Conserve")

      get "/api/v1/merchants/find?name=serve"
    end
    let!(:search_result) {JSON.parse(response.body, symbolize_names: true)}

    it 'returns successful' do
      expect(response).to be_successful
    end

    it 'returns correct info' do
      expect(search_result).to have_key(:data)
      expect(search_result[:data]).to be_a(Hash)

      expect(search_result[:data]).to have_key(:id)
      expect(search_result[:data][:id]).to be_a(String)

      expect(search_result[:data]).to have_key(:type)
      expect(search_result[:data][:type]).to eq('merchant')

      expect(search_result[:data]).to have_key(:attributes)
      expect(search_result[:data][:attributes]).to be_a(Hash)

      expect(search_result[:data][:attributes]).to have_key(:name)
      expect(search_result[:data][:attributes][:name]).to be_a(String)
      expect(search_result[:data][:attributes][:name]).to eq("Conserve")
    end

    it 'returns status 404 if no record found' do
      get "/api/v1/merchants/find?name=xzz"

      expect(response.status).to eq(404)
    end
  end

end
