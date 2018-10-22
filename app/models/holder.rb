class Holder < ApplicationRecord

  validates :location, uniqueness: true

  has_many :works, dependent: :destroy
  accepts_nested_attributes_for :works, allow_destroy: true

  geocoded_by :location
  after_validation :geocode, if: :location_changed?
end
