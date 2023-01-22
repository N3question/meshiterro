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
  
  ### 投稿したPostImageを一覧表示する一覧画面を作成
      # get_imageというメソッドを作成
        # アクションとは少し違い、特定の処理を名前で呼び出すことができる
        # PostImageモデルの中に記述
            # カラムを呼び出すようにこの処理（メソッド）を呼び出すことができる(以下参考例)
              # ID:1のレコードを取得し、@post_imageに格納する
                # @post_image = PostImage.find(1)
              # @post_imageに含まれるイメージを表示させるメソッドを実行する
              # カラムのように、インスタンス変数の後に"."をつけて、その後にメソッド名を繋げる
                # @post_image.get_image
    # def get_image
    #   if image.attached?
    #     image
    #   else
    #     'no_image.jpg'
    #.  end
    # end
  
    ## no_image.jpgをActiveStorageに格納するためにコードを書き換え
      # 上記で記述したメソッドだとRailsで画像のサイズ変更を行うことができない
          # 画像が設定されない場合
            # app/assets/imagesに格納されているno_image.jpgという画像を
            # デフォルト画像としてActiveStorageに格納し、格納した画像を表示する
  ## 投稿一覧で表示する全ての画像をコントローラで取得
    # Go_to post_images_controller.rb
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
  
end
