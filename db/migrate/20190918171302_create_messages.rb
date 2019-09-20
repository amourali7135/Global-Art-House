class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.text :content
      t.date :date_sent
      t.string :sent_by
      t.references :member, foreign_key: true

      t.timestamps
    end
  end
end
