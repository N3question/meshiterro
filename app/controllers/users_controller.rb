class UsersController < ApplicationController
  
  ## ユーザーの詳細ページを作成
      # @post_images = @user.post_images
        # アソシエーションを持っているモデル同士の記述方法
        # 特定のユーザ（@user）に関連付けられた投稿全て（.post_images）を取得し@post_imagesに渡す という処理を行う
        # 全体の投稿ではなく、個人が投稿したもの全てを表示
  ## NEXT 詳細ページの作成
    #.View ページの作成
    # Go_to app/views/users/show.html.erb
  def show
    @user = User.find(params[:id])
    @post_images = @user.post_images
  end

  def edit
  end
end
