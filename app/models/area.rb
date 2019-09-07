class Area < ApplicationRecord
  has_many :houses
  has_many :searches
  has_many :prices

  def commute_time
    CommuterTime.new({startcoord: [self.lat, self.lng]}).cityMapper_api
  end
end
