class ApplicationController < ActionController::Base
  # devise利用の機能（ユーザ登録、ログイン認証など）が使われる前に,configure_permitted_parametersメソッドが実行
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  ## サインイン後にどこに遷移するかを設定
      # after_sign_in_path_forはDeviseが用意しているメソッド
      # 今回はAboutページへ遷移するように設定
  def after_sign_in_path_for(resource)
    about_path
  end
  
  ## サインアウト後にどこに遷移するかを設定
      # Deviseのデフォルトは同じくroot_path
      # 今回はAboutページへ遷移するように設定
  ## 投稿機能の作成 > モデル・テーブルの作成
      # $ rails g model PostImageを実行
          # モデル名の頭は大文字
  ## NEXT migrationファイルの編集
      # Go_to db/migrate/(作成日時)_create_lists.rb
      
  def after_sign_out_path_for(resource)
    about_path
  end

  protected

  # configure_permitted_parametersメソッドでは、devise_parameter_sanitizer.permitメソッドを使うことで
  # ユーザー登録(sign_up)の際に、ユーザー名(name)のデータ操作を許可
  ## NEXT ログアウト機能を実装
    # devise によってすでに機能自体は作成されている
    # 実装しなければならないのはログアウト用のリンクのみ
    # ログアウトはHTTPメソッドがDELETEであることに注意
    # Go_to app/views/layouts/application.html.erb
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
