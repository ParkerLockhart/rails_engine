class InvoiceItem < ApplicationRecord
  belongs_to :item
  belongs_to :invoice

  validates :quantity, :unit_price, presence: true
end
