class House < ApplicationRecord
  include PgSearch::Model
  belongs_to :area
  geocoded_by :postcode
  after_validation :geocode, if: :will_save_change_to_postcode?

  validates :address, uniqueness: true

  pg_search_scope :search, against: [:bedroom, :bathroom, :price]

  def self.perform_search(keyword)
    if keyword.present?
      then House.search(keyword)
    else
      House.all
    end
  end
end
