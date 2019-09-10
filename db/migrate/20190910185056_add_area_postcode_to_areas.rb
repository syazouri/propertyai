class AddAreaPostcodeToAreas < ActiveRecord::Migration[5.2]
  def change
    add_column :areas, :area_postcode, :string
  end
end
