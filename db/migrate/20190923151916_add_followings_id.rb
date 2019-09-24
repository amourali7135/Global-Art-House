class AddFollowingsId < ActiveRecord::Migration[5.2]
  def change
    add_column :follows, :following_id, :integer
  end
end
