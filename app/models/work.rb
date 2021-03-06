class Work < ApplicationRecord

  validates :period_id, presence: true
  validates :holder_id, presence: true

  has_many :my_galleries, dependent: :destroy
  has_many :visits, dependent: :destroy
  has_many :pins, dependent: :destroy

  belongs_to :period, optional: true
  belongs_to :holder, optional: true

  attachment :img

  # 引数で渡されたユーザのidがmy_galleries/ visitsテーブル内にexists?しているか。存在:True、不在:False
  def added_to_my_gallery?(user)
    my_galleries.where(user_id: user.id).exists?
  end

  def added_to_my_visit?(user)
    visits.where(user_id: user.id).exists?
  end
  def self.search(search)
    search = Work.where(['title LIKE ? OR author LIKE ?', "%#{search}%", "%#{search}%"]).uniq
  end

end
