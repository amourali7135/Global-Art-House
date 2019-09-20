class CreateArts < ActiveRecord::Migration[5.2]
  def change
    create_table :arts do |t|
      t.string :title
      t.string :photo
      t.text :description
      t.date :completion_date
      t.text :inspiration
      t.boolean :available
      t.integer :price_cents
      t.references :member, foreign_key: true

      t.timestamps
    end
  end
end
