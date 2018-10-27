class Period < ApplicationRecord

  has_many :works, dependent: :destroy
  accepts_nested_attributes_for :works, allow_destroy: true

  def self.search(search)
    search = Work.where(['title LIKE ? OR author LIKE ?', "%#{search}%", "%#{search}%"]).uniq
  end

end
