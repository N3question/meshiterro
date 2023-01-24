class Favorite < ApplicationRecord

  ## Userモデルのid,PostImageモデルのidと関連付け
  ## NEXT PostImageモデルに関連付けを追加 Go_to app/models/post_image.rb
  belong_to :user
  belong_to :post_image
  
end
