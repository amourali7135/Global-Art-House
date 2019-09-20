class Member < ApplicationRecord
  has_many :arts
  has_many :comments
  has_many :descriptive_tags
  has_many :messages
  has_many :reactions
  has_many :follows
  has_many :orders

  has_one :shopping_cart
  has_one :location

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
end
