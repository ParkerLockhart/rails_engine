class Merchant < ApplicationRecord
  validates :name, presence: true

  has_many  :items
  has_many :invoices

  def self.name_search_single(query)
    Merchant.where("name ilike ?", "%#{query}%").order(:name).first! 
  end
end
