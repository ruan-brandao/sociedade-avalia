class UsersController < ApplicationController
	before_action :set_user, only: [:following, :followers]
  before_action :authenticate_user!, only: [:edit, :update_password]

  def following
  	@users = @user.followed_users.all
  end

  def followers
  	@users = @user.followers.all
  end

  def edit
    @user = current_user
  end

  def search
    if params[:search]
      @users = User.search(params[:search])
      redirect_to :back, alert: "A busca não retornou resultados." if @users.empty?
    end
  end

  def home
    redirect_to '/' unless user_signed_in?
    @posts = current_user.feed if user_signed_in?
  end

  def update_password
    @user = User.find(current_user.id)
    if @user.update_with_password(user_params)
      # Sign in the user by passing validation in case their password changed
      sign_in @user, :bypass => true
      redirect_to root_path
    else
      render "edit"
    end
  end

  private

  def set_user
  	@user = User.find_by_username(params[:id])
  end

  def user_params
    params.required(:user).permit(:password, :password_confirmation, :current_password)
  end
end
