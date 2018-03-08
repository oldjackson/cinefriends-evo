class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  def new
  end

  def show
  end

  def create
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
  end

  def dashboard
    if user_signed_in?
      @user = current_user
    else
      redirect_to root_path, notice: "Please sign in to see your dashboard :)"
    end
    @user = current_user
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:title, :director, :photo)
  end

end
