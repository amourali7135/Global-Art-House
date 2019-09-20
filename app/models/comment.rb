class Comment < ApplicationRecord
  belongs_to :art
  belongs_to :member

  validates :content, presence: true
end
