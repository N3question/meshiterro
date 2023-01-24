class FavoritesController < ApplicationController
 
  ## いいね後の保存した後 => post_imagesのshowページへリダイレクト
    # 以下全て記述（自動作成なし）
  ## NEXT 投稿画像に付けられた「いいね」に、自分（ログインユーザ）を含むかを
   # favorited_by?メソッドで判定 Go_to app/views/post_images/show.html.erb
  def create
    post_image = PostImage.find(params[:post_image_id])
    favorite = current_user.favorites.new(post_image_id: post_image.id)
    favorite.save
    redirect_to post_image_path(post_image)
  end
  
  def destroy
    post_image = PostImage.find(params[:post_image_id])
    favorite = current_user.favorites.find_by(post_image_id: post_image.id)
    favorite.destroy
    redirect_to post_image_path(post_image)
  end
  
end
