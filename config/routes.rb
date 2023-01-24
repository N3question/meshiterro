Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # devise のモデルを作成したことで、ルーティングが自動的に追加
  devise_for :users 
  
  root to: "homes#top"
  get 'homes/about'=>'homes#about' ,as:'about' # 追加。homes/aboutのルーティングに about ページを設定
  
  ## post_images コントローラの同じ名前のアクションに紐づく形で、以下のルーティングを自動生成
      # new, show, index, edit, create, update, destroy
      # onlyオプションを使用することで、生成するルーティングを限定
        # only の後に配列で記述されている"new","index","show"のアクション以外は、ルーティングが行われません。
        # 不要なルーティングが実行されないようにonlyを設定
      # ルーティングの確認
        # rails routes コマンドを実行
  ## NEXT 投稿画面の作成 Go_to app/controllers/post_image_controller.rb
  ## 追記（createアクション作成後）=> :create
    # NEXT ヘッダーに投稿フォームへのリンクを追加 Go_to app/views/layouts/application.html.erb
  ## 追記（destroyアクション作成後）=> :destroy
    # NEXT 詳細画面に削除を実行するためのリンクを追記 Go_to app/views/post_images/show.html.erb
  ## コメント投稿のルーティングを設定
        # do ~ end間の記述追加
          # post_commentsは、post_imagesに結びつく
          # $ rails routes を実行して確認してみる
          # このような親子関係を「ネストする」という
            # ネストしたURLを作成 => params[:post_image_id]でPostImageのidが取得可能
  ## NEXT コメント作成用のcreateアクション作成 Go_to app/controllers/post_comments_controller.rb
  ## post_comments に追記(コメント削除用のdestroyアクション作成後) => :destroy
  ## 追記（いいね機能のルーティング設定） => resource :favorites, only: [:create, :destory]
        # resource(単数形) => /:idがURLに含まれなくなる。
          # どのいいねを削除すればいいのかが特定できる 
          # => いいねのidは含める必要がない(params[:id]を使わなくても良い
          # それ自身のidが分からなくても、関連する他のモデルのidから特定できるといった場合に用いる
        # $ rails routes でルーティングを確認
        # いいね機能のコントローラを作成
            # $ rails g controller favorites
              # アクションを指定せず
              # 全て小文字、複数形
        ## NEXT いいね後の保存した後 => post_imagesのshowページへリダイレクト Go_to app/controllers/favortes_controller.rb
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resource :favorites, only: [:create, :destory]
    resources :post_comments, only: [:create, :destroy]
  end
  
  ## resourcesとonlyを使って、show, editのアクションのみ追加
  # get 'users/show'
  # get 'users/edit'
    # controller作成時にアクション作成 => 自動作成
  ## 追記（updateアクション作成後）=> :update
    # NEXT 編集画面へのリンクを追加
        # Go_to app/views/users/show.html.erb
  resources :users, only: [:show, :edit, :update]
  
end
