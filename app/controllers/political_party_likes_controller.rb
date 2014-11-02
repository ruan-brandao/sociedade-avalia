class PoliticalPartyLikesController < ApplicationController
	before_action :set_political_party_like

  def like
  	@political_party_like.value = true
  	@political_party_like.save unless current_user.has_liked_political_party?(PoliticalParty.where(id: @political_party_like.political_party_id).last.id)
  end

  def dislike
  	@political_party_like.value = false
  	@political_party_like.save unless current_user.has_liked_political_party?(PoliticalParty.where(id: @political_party_like.political_party_id).last.id)
  end

  private

  def set_political_party_like
  	@political_party_like = PoliticalPartyLike.new
  	@political_party_like.user_id = current_user.id
  	@political_party_like.political_party_id = params[:political_party_id]
  end
end
