class Area < ApplicationRecord
  has_many :houses
  has_many :searches
  has_many :prices
end
