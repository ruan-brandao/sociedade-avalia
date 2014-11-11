module ProfilesHelper
	def likes_percentage(user)
		(user.likes.to_f / user.total_likes_and_dislikes.to_f) *100
	end

	def dislikes_percentage(user)
		(user.dislikes.to_f / user.total_likes_and_dislikes.to_f) * 100
	end
end
