class Period < ApplicationRecord

  has_many :works, dependent: :destroy
  accepts_nested_attributes_for :works, allow_destroy: true

  def self.search(search)
    search = Period.joins(:works).where(['time_frame LIKE ? OR title LIKE ? OR author LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%"]).uniq
  end

end
