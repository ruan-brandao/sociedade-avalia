module PostLikesHelper
	def post_like_value(post, user)
		return false if PostLike.where(user_id: user.id, post_id: post.id).empty?
		PostLike.where(user_id: user.id, post_id: post.id).last.value
	end
end
