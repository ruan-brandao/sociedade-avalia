module PoliticianLikesHelper
	def politician_like_value(politician, user)
		return false if PoliticianLike.where(liker_id: user.id, liked_id: politician.id).empty?
		PoliticianLike.where(liker_id: user.id, liked_id: politician.id).last.value
	end
end
