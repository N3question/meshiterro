class PostComment < ApplicationRecord
  
  ## Userモデル,PostImageモデルの関連付け
  ## コメント機能に必要なコントローラを作成
    # $ rails g controller post_comments を実行
        # コントローラ名は小文字、複数形 
  ## NEXT コメント機能に必要な投稿機能・投稿削除機能の実装 Go_to config/routes.rb
  belongs_to :user
  belongs_to :post_image
  
end
