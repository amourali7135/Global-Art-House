class AddFollowerIdToFollow < ActiveRecord::Migration[5.2]
  def change
    add_column :follows, :follower_id, :integer
  end
end
