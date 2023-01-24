class Favorite < ApplicationRecord

  ## Userモデルのid,PostImageモデルのidと関連付け
  ## NEXT PostImageモデルに関連付けを追加 Go_to app/models/post_image.rb
  belongs_to :user
  belongs_to :post_image
  
end
