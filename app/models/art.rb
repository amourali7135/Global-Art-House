class Art < ApplicationRecord
  belongs_to :member

  has_many :descriptive_tags
  has_many :comments

  validates :title, presence: true
  validates :photo, presence: true
  validates :description, presence: true
end
