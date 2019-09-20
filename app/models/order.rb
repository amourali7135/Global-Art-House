class Order < ApplicationRecord
  belongs_to :member
  belongs_to :shopping_cart

  validates :address_line_1, presence: true
  validates :address_line_2, presence: true
  validates :address_city, presence: true
  validates :address_zipcode, presence: true
  validates :state, presence: true
  validates :country, presence: true
  validates :phone_number, presence: true
  validates :payment, presence: true
end
