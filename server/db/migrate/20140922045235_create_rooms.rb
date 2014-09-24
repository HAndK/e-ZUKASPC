class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :hash_tag
      t.string :name
      t.text :memo
      t.timestamps
    end

    add_index :rooms, :hash_tag, unique: true
  end
end
