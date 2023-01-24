class PostCommentsController < ApplicationController

  ## createアクション作成
    # ネストしたURLを作成 => params[:post_image_id]でPostImageのidが取得可能
    # コメントを作成し、データベースに保存する記述
      # current_user.post_comments.new == PostComment.newと省略可能
  ## NEXT コメントを投稿するためのインスタンス変数を定義 Go_to app/controllers/post_images_controller.rb
  def create
    post_image = PostImage.find(params[:post_image_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.post_image_id = post_image.id
    comment.save
    redirect_to post_image_path(post_image)
  end
  
  ## destroyアクション作成
  ## NEXT ルーティングの確認 Go_to config/routes.rb
  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to post_image_path(params[:post_image_id])
  end
  
  private
  
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
  
end
