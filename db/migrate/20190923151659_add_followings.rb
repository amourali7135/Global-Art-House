class AddFollowings < ActiveRecord::Migration[5.2]
  def change
    add_column :following, :following_id, :integer
  end
end
