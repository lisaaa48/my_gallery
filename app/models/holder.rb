class Holder < ApplicationRecord
  has_many :works, dependent: :destroy
  accepts_nested_attributes_for :works, allow_destroy: true
end
