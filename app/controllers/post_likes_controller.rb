class PostLikesController < ApplicationController
	before_action :set_post_like

  def like
  	@post_like.value = true
  	@post_like.save
  end

  def dislike
  	@post_like.value = false
    @post_like.save
  end

  private

  def set_post_like
  	@post_like = PostLike.new
  	@post_like.user_id = current_user.id
  	@post_like.post_id = Post.find_by(params[:id])
	end
end
