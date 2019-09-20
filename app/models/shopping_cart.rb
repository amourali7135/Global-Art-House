class ShoppingCart < ApplicationRecord
  belongs_to :member
  has_one :order
  has_many :cart_products
  has_many :arts, through: :cart_products

  monetize :total_price_cents

end
