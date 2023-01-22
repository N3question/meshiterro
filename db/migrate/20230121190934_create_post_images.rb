class CreatePostImages < ActiveRecord::Migration[6.1]
  
  ## migrationファイルの編集
    # db/migrate/(作成日時)_create_lists.rb
        # マイグレーションファイルを開き、必要なカラムが揃っているかを確認。必要に応じてカラムを追加
        # t.データ型名 :カラム名
        # 注意点：id,created_at, updated_atの3つのカラムは自動で作成されるので不要
  ## $ rails db:migrateを実行
      # db/schema.rbでテーブルが問題なく作成されているかを確認
　## NEXT PostImage モデルに、ActiveStorage を使って画像を持たせる
　    # PostImage モデルの設定ファイルに、記述を追加する必要
　        # Go_to app/models/post_image.rb
  def change
    create_table :post_images do |t|
      t.string :shop_name # 追加
      t.text :caption # 追加
      t.integer :user_id # 追加
      t.timestamps
    end
  end
end
