class CreateDescriptiveTags < ActiveRecord::Migration[5.2]
  def change
    create_table :descriptive_tags do |t|
      t.string :tag
      t.references :art, foreign_key: true
      t.references :member, foreign_key: true

      t.timestamps
    end
  end
end
