class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :content
      t.integer :likes
      t.integer :dislikes

      t.timestamps
    end
  end
end
