class ApplicationController < ActionController::Base
  # devise利用の機能（ユーザ登録、ログイン認証など）が使われる前に,configure_permitted_parametersメソッドが実行
  before_action :configure_permitted_parameters, if: :devise_controller?

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
