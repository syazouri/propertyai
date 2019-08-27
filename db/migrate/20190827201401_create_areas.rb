class CreateAreas < ActiveRecord::Migration[5.2]
  def change
    create_table :areas do |t|
      t.string :name
      t.integer :sold_price
      t.string :schools
      t.string :crime
      t.string :demographics
      t.integer :price
      t.string :growth
      t.string :demand

      t.timestamps
    end
  end
end
