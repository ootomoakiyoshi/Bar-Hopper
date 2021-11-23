class Bar < ApplicationRecord
  belongs_to :user
   # 画像アップ用のメソッド
  attachment :image

  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :bar_name, presence: true, length: {maximum: 20}
  validates :caption, presence: true
  validates :image, presence: true
# 地図機能
  geocoded_by :address
  after_validation :geocode
# いいね機能
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
