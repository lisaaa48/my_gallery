class Work < ApplicationRecord

  validates :img_id, presence: true
  validates :title, presence: true
  validates :author, presence: true
  validates :production_year, presence: true
  validates :tool, presence: true
  validates :period_id, presence: true
  validates :holder_id, presence: true

  has_many :my_galleries, dependent: :destroy
  has_many :visits, dependent: :destroy
  has_many :pins, dependent: :destroy

  belongs_to :period, optional: true
  belongs_to :holder, optional: true

  attachment :img

  # Holder :locationとPeriod :time_frameからも検索できないかな?
  # scope :search, (->(word) { where('title LIKE ? OR author LIKE ? OR author LIKE ? OR author LIKE ? OR author LIKE ?',
  #                                  "%#{sanitize_sql_like(word)}%",
  #                                  "%#{sanitize_sql_like(word)}%") })

  # 引数で渡されたユーザのidがFavoritesテーブル内にexists?しているか。存在:True、不在:False
  def added_to_my_gallery?(user)
    my_galleries.where(user_id: user.id).exists?
  end

  def added_to_my_visit?(user)
    visits.where(user_id: user.id).exists?
  end

end
