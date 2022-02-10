require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'relationships' do
    it { should belong_to(:merchant) }
    it { should have_many(:invoice_items) }
    it { should have_many(:invoices).through(:invoice_items) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:unit_price) }
  end

  describe 'class methods' do
    describe 'name_search' do
      it 'returns items matched by name' do
        item_1 = create(:item, name: "Observe")
        item_2 = create(:item, name: "Preserve")
        item_3 = create(:item, name: "Deserve")
        item_4 = create(:item, name: "Conserve")
        item_5 = create(:item, name: "Pikachu" )
        item_6 = create(:item, name: "Shirt")

        expect(Item.name_search("serve")).to eq([item_1, item_2, item_3, item_4])
        expect(Item.name_search("serve")).to_not include(item_5)
        expect(Item.name_search("serve")).to_not include(item_6)
      end
    end
  end 
end
