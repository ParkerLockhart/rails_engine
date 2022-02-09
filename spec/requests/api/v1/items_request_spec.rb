require 'rails_helper'

describe 'Items API endpoints' do
  describe 'GET items' do
    before(:each) do
      create_list(:item, 3)
      get '/api/v1/items'
    end
    let!(:items) {JSON.parse(response.body, symbolize_names: true)}

    it 'returns successful' do
      expect(response).to be_successful
    end
    it 'returns correct number of objects' do
      expect(items[:data].count).to eq(3)
    end
    it 'returns correct info for each object' do
      items[:data].each do |item|
        expect(item).to have_key(:id)
        expect(item[:id]).to be_a(String)

        expect(item).to have_key(:attributes)
        expect(item[:attributes]).to be_a(Hash)

        expect(item[:attributes]).to have_key(:name)
        expect(item[:attributes][:name]).to be_a(String)

        expect(item[:attributes]).to have_key(:description)
        expect(item[:attributes][:description]).to be_a(String)

        expect(item[:attributes]).to have_key(:unit_price)
        expect(item[:attributes][:unit_price]).to be_a(Float)

        expect(item[:attributes]).to have_key(:merchant_id)
        expect(item[:attributes][:merchant_id]).to be_an(Integer)
      end
    end
  end

  describe 'GET item' do
    before(:each) do
      item_1 = FactoryBot.create(:item)
      get "/api/v1/items/#{item_1.id}"
    end
    let!(:item_1) {JSON.parse(response.body, symbolize_names: true)}

    it 'returns successful' do
      expect(response).to be_successful
    end

    it 'returns correct info' do
      expect(item_1).to have_key(:data)
      expect(item_1[:data]).to be_a(Hash)

      expect(item_1[:data]).to have_key(:id)
      expect(item_1[:data][:id]).to be_a(String)

      expect(item_1[:data]).to have_key(:type)
      expect(item_1[:data][:type]).to eq('item')

      expect(item_1[:data]).to have_key(:attributes)
      expect(item_1[:data][:attributes]).to be_a(Hash)

      attributes = item_1[:data][:attributes]
      expect(attributes).to have_key(:name)
      expect(attributes[:name]).to be_a(String)

      expect(attributes).to have_key(:description)
      expect(attributes[:description]).to be_a(String)

      expect(attributes).to have_key(:unit_price)
      expect(attributes[:unit_price]).to be_a(Float)

      expect(attributes).to have_key(:merchant_id)
      expect(attributes[:merchant_id]).to be_an(Integer)
    end

    it 'returns status 404 if merchant ID invalid' do
      get "/api/v1/items/98479819"
      expect(response.status).to eq(404)
    end 
  end
end
