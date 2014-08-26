class UsersController < ApplicationController
	before_action :set_user

  def following
  	@users = @user.followed_users.all
  end

  def followers
  	@users = @user.followers.all
  end

  private

  def set_user
  	@user = User.find_by_username(params[:id])
  end
end
