class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
    	t.references :staff_member, null: false # ユーザテーブルへの外部キー
      t.text :text, null: false #ツイート
      t.string :hashtags, array: true, default: [] #ハッシュタグ
      t.timestamps
    end

    add_foreign_key :tweets, :users
  end
end
