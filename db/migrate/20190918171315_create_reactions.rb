class CreateReactions < ActiveRecord::Migration[5.2]
  def change
    create_table :reactions do |t|
      t.integer :count
      t.references :member, foreign_key: true
      t.references :art, foreign_key: true

      t.timestamps
    end
  end
end
