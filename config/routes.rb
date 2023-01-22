Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # devise のモデルを作成したことで、ルーティングが自動的に追加
  devise_for :users 
  
  root to: "homes#top"
  
  # post_images コントローラの同じ名前のアクションに紐づく形で、以下のルーティングを自動生成
      # new, show, index, edit, create, update, destroy
      # onlyオプションを使用することで、生成するルーティングを限定
        # only の後に配列で記述されている"new","index","show"のアクション以外は、ルーティングが行われません。
        # 不要なルーティングが実行されないようにonlyを設定
      # ルーティングの確認
        # rails routes コマンドを実行
  # get 'post_image/new'
  # get 'post_image/index'
  # get 'post_image/show'
  resources :post_images, only: [:new, :index, :show]
  
  get 'homes/about'=>'homes#about' ,as:'about' # 追加。homes/aboutのルーティングに about ページを設定
  
end
