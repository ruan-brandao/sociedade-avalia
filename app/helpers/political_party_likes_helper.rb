module PoliticalPartyLikesHelper
	def political_party_like_value(political_party, user)
		return false if PoliticalPartyLike.where(user_id: user.id, political_party_id: political_party.id).empty?
		PoliticalPartyLike.where(user_id: user.id, political_party_id: political_party.id).last.value
	end
end
