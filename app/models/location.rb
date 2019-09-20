class Location < ApplicationRecord
  belongs_to :member

  validates :city, presence: true
  validates :country, presence: true

  has_one :flag_photo
end
