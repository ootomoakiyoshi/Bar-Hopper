class Bar < ApplicationRecord

belongs_to :user

# 画像アップ用のメソッド
attachment :image
has_many :comments, dependent: :destroy
end