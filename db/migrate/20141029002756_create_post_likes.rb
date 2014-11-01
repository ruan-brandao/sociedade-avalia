class CreatePostLikes < ActiveRecord::Migration
  def change
    create_table :post_likes do |t|
      t.integer :user_id
      t.integer :post_id
      t.boolean :value

      t.timestamps
    end
    add_index :post_likes, [:user_id, :post_id], unique: true
  end
end
