source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.7'
# Use sqlite3 as the database for Active Record
gem 'sqlite3', '~> 1.4'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
## 画像のサイズ変更を行うGemの導入
    # コメントアウト解除済み
## image_processingを使える状態にする
    # $ bundle installというコマンドを実行
## NEXT エラー回避の対応
    # Go_to config/environments/development.rb
gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver', '>= 4.0.0.rc1'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

## devise を meshiterro アプリケーションにインストール
  # gem '[インストールしたい Gem の名前]
## $ bundle install を実行
  # ”Gemfile”に記述した Gem を、Rails アプリケーション内で使用できるようにインストールするためのコマンド
## $ rails g devise:installを実行
  # devise のインストールコマンドを実行
## ユーザテーブルを作成してユーザ情報を保存
  # $ rails g devise モデル名（頭大文字）を実行
      # devise を使うと、記述が変わることに注意しましょう。rails g devise モデル名の記述は、devise 独自のルール
      # 作成した User モデルに devise で使用する機能が記述されている
## NEXT devise のユーザーテーブルをカスタマイズする
  # Go_to db/migrate/（年月日時分秒）_devise_create_users.rb
gem 'devise'

## Kaminariのインストール
  # 以下記述後 $ bundle installを実行してkaminariをインストール
  # kaminariの設定ファイルを作成 => $ rails g kaminari:config実行
  # kaminariがページャで利用するテンプレートを作成 => $ rails g kaminari:views default実行
  # NEXT ページャを実装 Go_to app/controllers/post_images_controller.rb
gem 'kaminari','~>1.2.1'