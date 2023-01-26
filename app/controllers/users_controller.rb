class UsersController < ApplicationController
  
  ## ユーザーの詳細ページを作成
      # @post_images = @user.post_images
        # アソシエーションを持っているモデル同士の記述方法
        # 特定のユーザ（@user）に関連付けられた投稿全て（.post_images）を取得し@post_imagesに渡す という処理を行う
        # 全体の投稿ではなく、個人が投稿したもの全てを表示
  ## NEXT 詳細ページの作成
    #.View ページの作成
    # Go_to app/views/users/show.html.erb
  ## ページャを実装
    # .page(params[:page])を追加
    # NEXT Go_to app/views/post_images/_list.html.erb
  def show
    @user = User.find(current_user.id)
    @post_images = @user.post_images.page(params[:page])
  end

  ## 編集画面の作成 => 編集機能用のアクションを定義
  ## NEXT app/views/usersフォルダ内に、edit.html.erbファイルを作成
  def edit
    # アクセス制限
    user_id = params[:id].to_i
    unless user_id == current_user.id
      redirect_to post_images_path
    end
    # ここまで
    
    @user = User.find(params[:id])
  end
  
  ## 更新機能を作成
  ## データを受け取るためのparamsも同時に作成
  ## NEXT ルーティングの編集 Go_to config/routes.rb
  def update
    # アクセス制限
    user_id = params[:id].to_i
    unless user_id == current_user.id
      redirect_to post_images_path
    end
    # ここまで
    
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(current_user.id)
  end
  
  private
  
  ## データ受け取りのためのparams
    # reqire データの絞り込み
    # permit 絞り込んだデータの中から保存する内容を選択
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
  
end
