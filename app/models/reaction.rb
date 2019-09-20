class Reaction < ApplicationRecord
  belongs_to :member
  belongs_to :art

  has_many :reaction_types
end
