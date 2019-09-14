class House < ApplicationRecord
  belongs_to :area
  geocoded_by :postcode
  after_validation :geocode, if: :will_save_change_to_postcode?
end
