class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :income, :integer
    add_column :users, :credit_score, :integer
    add_column :users, :date_of_birth, :datetime
    add_column :users, :deposit, :integer
    add_column :users, :borrowing, :integer
  end
end