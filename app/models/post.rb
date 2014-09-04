class Post < ActiveRecord::Base
	belongs_to :user

	validates :content, presence: true
	validates :likes, numericality: { greater_than_or_equal_to: 0 }
	validates :dislikes, numericality: { greater_than_or_equal_to: 0 }

	def self.from_users_followed_by(user)
    followed_user_ids = "SELECT followed_id FROM relationships
                         WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id",
          user_id: user.id)
  end
end
