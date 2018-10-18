class Visit < ApplicationRecord

  geocoded_by :location
  after_validation :geocode

  belongs_to :user
  belongs_to :work
end
