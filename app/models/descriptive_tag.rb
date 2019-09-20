class DescriptiveTag < ApplicationRecord
  belongs_to :art
  belongs_to :member

  validates :tag, presence: true
end
