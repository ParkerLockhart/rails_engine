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
end
