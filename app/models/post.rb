class Post < ActiveRecord::Base
	belongs_to :user
	has_many :post_likes

	default_scope -> { order('created_at DESC') }

	validates :content, presence: true

	def self.from_users_followed_by(user)
    followed_user_ids = "SELECT followed_id FROM relationships
                         WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id",
          user_id: user.id)
  end

  def likes
  	self.post_likes.select(:value).count
  end

  def dislikes
  	self.post_likes.count - self.likes
  end
end
