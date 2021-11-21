class Bar < ApplicationRecord
  belongs_to :user
  attachment :image
  # 画像アップ用のメソッド
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :bar_name, presence: true
  validates :caption, presence: true
  validates :image, presence: true

  geocoded_by :address
  after_validation :geocode

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
