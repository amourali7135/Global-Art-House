class Member < ApplicationRecord
  has_many :arts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :descriptive_tags
  has_many :messages, dependent: :destroy
  has_many :reactions, dependent: :destroy
  has_many :follows, dependent: :destroy
  has_many :orders
  has_many :likes, dependent: :destroy

  has_one :shopping_cart
  has_one :location


  validates :first_name, presence: true, on: :update
  validates :last_name, presence: true, on: :update
  validates :email, presence: true, on: :update

  def follow(member_id)
    following_relationships.create(following_id: member_id)
  end

  def unfollow(member_id)
    following_relationships.find_by(following_id: member_id).destroy
  end

  # def like_art(art_id)
  #   likes.create(art_id: art_id)
  # end

  # def unlike_art(art_id)
  #   likes.find_by(art_id: art_id).destroy
  # end
end
