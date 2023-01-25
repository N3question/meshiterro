# frozen_string_literal: true

Kaminari.configure do |config|
  ## ページあたりに表示させる件数の設定 => デフォは25件 => サーバ起動して確認,NEXT Bootstrapの導入
  config.default_per_page = 5
  # config.max_per_page = nil
  # config.window = 4
  # config.outer_window = 0
  # config.left = 0
  # config.right = 0
  # config.page_method_name = :page
  # config.param_name = :page
  # config.max_pages = nil
  # config.params_on_first_page = false
end
