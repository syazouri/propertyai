class CreateHouses < ActiveRecord::Migration[5.2]
  def change
    create_table :houses do |t|
      t.string :address
      t.string :postcode
      t.integer :bedroom
      t.text :description
      t.integer :bathroom
      t.integer :square_feet
      t.jsonb :council_tax
      t.jsonb :ptal
      t.boolean :green_belt
      t.jsonb :restaurants
      t.references :area, foreign_key: true

      t.timestamps
    end
  end
end
