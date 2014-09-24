class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
    	t.references :user, null: false # ユーザテーブルへの外部キー
    	t.references :room, null: false # ルームテーブルへの外部キー
      t.text :text, null: false #ツイート
      t.string :hashtags, array: true, default: [] #ハッシュタグ
      t.timestamps
    end

    add_foreign_key :tweets, :users
    add_foreign_key :tweets, :rooms
  end
end
