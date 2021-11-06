class Bar < ApplicationRecord

belongs_to :user

# 画像アップ用のメソッド
attachment :image

end