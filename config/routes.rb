Rails.application.routes.draw do
  # devise のモデルを作成したことで、ルーティングが自動的に追加
  devise_for :users 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "homes#top"
end
