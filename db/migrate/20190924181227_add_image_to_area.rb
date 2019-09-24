class AddImageToArea < ActiveRecord::Migration[5.2]
  def change
    add_column :areas, :image, :string
  end
end
