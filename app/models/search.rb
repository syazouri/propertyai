class Search < ApplicationRecord
  belongs_to :user
  geocoded_by :work_postcode
  after_validation :geocode, if: :will_save_change_to_work_postcode?
end
