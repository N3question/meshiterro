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
  
  ## コメント機能の実装
    # UserモデルとPostCommentモデルとの1:Nの関係も実装
    # dependent: :destroy
      # Userのデータが削除されたとき、そのUserが投稿したコメントデータも一緒に削除
  ## NEXT Go_to app/models/post_image.rb
  has_many :post_comments, dependent: :destroy  
    
  ## ユーザーごとのプロフィール画像を保存できないため追記
        # has_one_attached :profile_image
            # profile_imageという名前でActiveStorageでプロフィール画像を保存できるように設定
        # profile_image.variant(resize_to_limit: [100, 100]).processed
            # 画像を縦横共に100pxのサイズに変換
            # これだけだと利便性がそこまで高くない！！！
        ## メソッドの部分を修正
            # メソッドに対して引数を設定し、受け取った引数のサイズに変換できるようにする
            # (resize_to_limit: [100,100]) => (resize_to_limit: [width, height])
  ## ユーザーに関する機能を追加するためのコントローラ作成
    # $ rails g controller コントローラ名 アクション名 を実行
        # showアクション、editアクションはViewが必要なので同時に作成
        # コントローラ名は頭大文字の複数形
    ## ルーティングを確認
  ## NEXT ユーザーの詳細ページを作成
    # Go_to app/controllers/users_controller.rb
  has_one_attached :profile_image
  
  def get_profile_image(width,height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
end
