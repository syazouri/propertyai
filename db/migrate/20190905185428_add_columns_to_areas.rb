class AddColumnsToAreas < ActiveRecord::Migration[5.2]
  def change
    add_column :areas, :average_deposit, :integer
  end
end
