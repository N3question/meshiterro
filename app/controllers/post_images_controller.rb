class PostImagesController < ApplicationController
  
  ## Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する。
  ## NEXT Viewの作成
    # Go_to app/views/post_images/new.html.erb
        # コードを記述
  def new
    @post_image = PostImage.new
  end

  ## 投稿データを保存するためにcreateアクションを作成
      #1 投稿するデータを PostImage モデルに紐づくデータとして保存する準
          # フォームに入力されたデータ(shop_name や caption,image など)が、@post_image に格納
      #2 @post_image(投稿データ)のuser_idを、current_user.id(今ログインしているユーザーの ID)に指定することで
      #  投稿データに、今ログイン中のユーザーの ID を持たせる
      #3 データをデータベースに保存するためのsaveメソッド実行
      #4 リダイレクト先の指定
  ## 同時にストロングパラメータも作成
  ## NEXT ルーティングの追加
    # resources に :create を追加し完了
  def create
    @post_image = PostImage.new(post_image_params) #1
    @post_image.user_id = current_user.id #2
    @post_image.save #3
    redirect_to post_images_path #4
  end
  
  ## タイムライン上に表示する投稿データを取得できるようにする
    # all => メソッドの一種
      # そのモデルがやりとりしているデータベースのテーブルに保存されている、全てのレコードをまとめて取得
  ## NEXT View => Go_to app/views/post_images/index.html.erbを
  def index
    @post_images = PostImage.all
  end

  ## 詳細画面が表示されるように設定
  ## NEXT app/views/post_imagesフォルダ内にshow.html.erbファイルを作成
  def show
    @post_image = PostImage.find(params[:id])
  end
  
  ## 投稿削除機能を実装
    # @post_image = PostImage.find(params[:id])
        # データ（レコード）を一件取得
    # @post_image.destroy
        # データ（レコード）を削除
    # redirect_to post_images_path
        # 投稿一覧画面へリダイレクト
          # 投稿の削除後は一覧に遷移する
  ## destoryアクションへのルーティング設定
    # routes.rbのresourcesの部分にdestroyを追記
  def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    redirect_to post_images_path
  end
  
  ## 投稿データのストロングパラメータ
    # params
        # formから送られてくるデータはparamsの中に入っている
    # require
        # 送られてきたデータの中からモデル名(ここでは:list)を指定し、データを絞り込み
    # permit
        # requireで絞り込んだデータの中から、保存を許可するカラムを指定
  private

  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end
end
