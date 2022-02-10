require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe 'relationships' do
    it { should have_many(:items) }
    it { should have_many(:invoices) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'class methods' do
    describe 'name_search_single' do
      it 'returns first merchant matching search term' do
        merchant_1 = create(:merchant, name: "Observe")
        merchant_2 = create(:merchant, name: "Preserve")
        merchant_3 = create(:merchant, name: "Deserve")
        merchant_4 = create(:merchant, name: "Conserve")

        expect(Merchant.name_search_single("serve")).to eq(merchant_4)
        expect(Merchant.name_search_single("pre")).to eq(merchant_2)
        expect(Merchant.name_search_single("des")).to eq(merchant_3)
      end
    end
  end

end
