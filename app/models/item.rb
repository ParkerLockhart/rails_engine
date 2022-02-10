class Item < ApplicationRecord
   belongs_to :merchant
   has_many :invoice_items
   has_many :invoices, through: :invoice_items
   validates :name, :description, :unit_price, presence: true

  def self.name_search(query)
    Item.where("name ilike ?", "%#{query}%")
  end 
end
