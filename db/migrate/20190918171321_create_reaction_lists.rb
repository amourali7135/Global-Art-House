class CreateReactionLists < ActiveRecord::Migration[5.2]
  def change
    create_table :reaction_lists do |t|
      t.string :reaction_types
      t.references :reaction, foreign_key: true

      t.timestamps
    end
  end
end
