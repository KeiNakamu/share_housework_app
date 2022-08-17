class UsersController < ApplicationController
  before_action :set_user, only: %i[ followings followers ]
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    # redirect_to user_path(current_user.id) unless @user == current_user
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "ユーザーの内容を更新しました"
    else
      flash.now[:danger] = "ユーザーを更新できませんでした"
      render :edit
    end
  end

  def followings
    @users = @user.following
  end

  def followers
    @users = @user.followers
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :profile, :image, :image_cache)
  end

end
