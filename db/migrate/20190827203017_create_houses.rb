class CreateHouses < ActiveRecord::Migration[5.2]
  def change
    create_table :houses do |t|
      t.string :address
      t.string :postcode
      t.integer :bedroom
      t.text :description
      t.integer :bathroom
      t.integer :square_feet
      t.string :council_tax
      t.string :ptal
      t.string :green_belt
      t.string :restaurants
      t.references :area, foreign_key: true

      t.timestamps
    end
  end
end
