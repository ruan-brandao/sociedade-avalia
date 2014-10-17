class ProfilesController < ApplicationController
	before_action :require_admin, only: [:turn_to_politician]

  def show
  	@user = User.find_by_username(params[:id])
  	if @user
  		@posts = @user.posts.all
  		render action: :show
  	else
  		render file: 'public/404', status: 404, formats: [:html]
  	end
  end

  def turn_to_politician
  	@user = User.find(params[:id])
  	@user.politician = true
  	@user.save
  	redirect_to "/#{@user.username}"
  end

end
