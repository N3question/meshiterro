class PostImage < ApplicationRecord
  ## PostImage モデルに、ActiveStorage を使って画像を持たせる
  ## NEXT 1:N の関係性をモデルに実装
    # Go_to app/models/user.rb
  has_one_attached :image
  
  ## PostImage モデルに User モデルを関連付け
    # PostImage モデルに対して、User モデルとの関係性を追加
      # PostImage モデルに関連付けられるのは、1 つの User モデルだけ
      # 単数形の「user」になっている点に注意
  ## PostImages コントローラを作成
    # $ rails g controller コントローラ名 アクション名 アクション名
      # 今回は new, index, show アクションも同時に作成
  ## NEXT ルーティングの確認
    # Go_to config/routes.rb
   belongs_to :user
end
