class PostLikesController < ApplicationController
	before_action :set_post_like

  def like
  	@post_like.value = true
  	flash[:alert] = "Fail" unless @post_like.save
  end

  def dislike
  	@post_like.value = false
    flash[:alert] = "Fail" unless @post_like.save
  end

  private

  def post_like_params
		params.require(:post_like).permit(:user_id, :post_id, :value)
	end

  def set_post_like
  	@post_like = PostLike.new #(post_like_params)
  	@post_like.user_id = current_user.id
  	@post_like.post_id = Post.find_by(params[:id]).id
	end
end
