class PoliticianLikesController < ApplicationController
	before_action :set_politician_like

  def like
  	@politician_like.value = true
  	@politician_like.save unless current_user.has_liked_politician?(User.where(id: @politician_like.liked_id).last.id)
    redirect_to :back
  end

  def dislike
  	@politician_like.value = false
  	@politician_like.save unless current_user.has_liked_politician?(User.where(id: @politician_like.liked_id).last.id)
    redirect_to :back
  end

  private

  def set_politician_like
  	@politician_like = PoliticianLike.new
  	@politician_like.liker_id = current_user.id
  	@politician_like.liked_id = params[:politician_id]
  end
end
