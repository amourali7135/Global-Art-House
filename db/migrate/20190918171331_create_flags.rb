class CreateFlags < ActiveRecord::Migration[5.2]
  def change
    create_table :flags do |t|
      t.string :photo
      t.references :location, foreign_key: true

      t.timestamps
    end
  end
end
