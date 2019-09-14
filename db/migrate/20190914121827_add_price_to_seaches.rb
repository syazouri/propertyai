class AddPriceToSeaches < ActiveRecord::Migration[5.2]
  def change
    add_column :searches, :price, :string
  end
end
