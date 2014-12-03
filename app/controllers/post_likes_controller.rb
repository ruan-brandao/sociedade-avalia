class PostLikesController < ApplicationController
	before_action :set_post_like

  def like
  	@post_like.value = true
  	@post_like.save unless current_user.has_liked_post?(Post.where(id: @post_like.post_id).last.id)
    redirect_to :back
  end

  def dislike
  	@post_like.value = false
    @post_like.save unless current_user.has_liked_post?(Post.where(id: @post_like.post_id).last.id)
    redirect_to :back
  end

  private

  def set_post_like
  	@post_like = PostLike.new
  	@post_like.user_id = current_user.id
  	@post_like.post_id = params[:post_id]
	end
end
