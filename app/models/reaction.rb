class Reaction < ApplicationRecord
  belongs_to :member
  belongs_to :art

  has_many :reaction_types

  validates :user_id, uniqueness: {scope: :art_id}
end
