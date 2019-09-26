class Area < ApplicationRecord
  has_many :houses
  has_many :searches
  has_many :prices
  geocoded_by :area_postcode
  after_validation :geocode, if: :will_save_change_to_area_postcode?

  def commute_time
    CommuterTime.new({startcoord: [self.lat, self.lng]}).cityMapper_api
  end

  # def photo_safe

  # end
end
