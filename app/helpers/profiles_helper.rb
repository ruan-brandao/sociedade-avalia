module ProfilesHelper
	def likes_percentage(record)
		(record.likes.to_f / record.total_likes_and_dislikes.to_f) *100
	end

	def dislikes_percentage(record)
		(record.dislikes.to_f / record.total_likes_and_dislikes.to_f) * 100
	end
end
