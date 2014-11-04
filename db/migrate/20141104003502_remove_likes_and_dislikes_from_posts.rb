class RemoveLikesAndDislikesFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :likes, :integer
    remove_column :posts, :dislikes, :integer
  end
end
