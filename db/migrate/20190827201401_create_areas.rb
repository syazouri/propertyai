class CreateAreas < ActiveRecord::Migration[5.2]
  def change
    create_table :areas do |t|
      t.string :name
      t.jsonb :sold_price
      t.jsonb :schools
      t.jsonb :crime
      t.jsonb :demographics
      t.jsonb :price
      t.jsonb :growth
      t.jsonb :demand

      t.timestamps
    end
  end
end
