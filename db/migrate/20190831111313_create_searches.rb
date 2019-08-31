class CreateSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :searches do |t|
      t.integer :borrowing
      t.integer :gross_annual
      t.integer :deposit
      t.integer :credit_score
      t.boolean :school
      t.integer :distance_to_work
      t.references :area, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
