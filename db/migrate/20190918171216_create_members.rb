class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.string :first_name
      t.string :last_name
      t.boolean :artist
      t.string :artist_name
      t.string :photo
      t.string :email
      t.text :bio
      t.integer :age
      t.string :birth_country
      t.text :languages_spoken
      t.string :instagram
      t.string :facebook
      t.string :website

      t.timestamps
    end
  end
end
