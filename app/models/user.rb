class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  ## NEXT 1:N の関係性をモデルに実装 > User モデルに PostImage モデルを関連付ける
    # User モデルに対して、PostImage モデルが 1:N
        # dependent: :destroy
          #1:Nの1側が削除されたとき、N側を全て削除する
  ## NEXT PostImage モデルに User モデルを関連付ける
    # Go_to app/models/post_image.rb
  has_many :post_images, dependent: :destroy
end
