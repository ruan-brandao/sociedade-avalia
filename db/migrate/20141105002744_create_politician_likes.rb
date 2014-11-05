class CreatePoliticianLikes < ActiveRecord::Migration
  def change
    create_table :politician_likes do |t|
      t.integer :liker_id
      t.integer :liked_id
      t.boolean :value

      t.timestamps
    end
    add_index :politician_likes, :liker_id
    add_index :politician_likes, :liked_id
    add_index :politician_likes, [:liker_id, :liked_id], unique: true
  end
end
