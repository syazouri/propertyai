class AddCrimeToSeaches < ActiveRecord::Migration[5.2]
  def change
    add_column :searches, :crime, :string
  end
end
