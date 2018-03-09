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

      @unmatched_postings = []
      @pairings = @user.pairings # movies posted by other users accepted by current user

      @user.postings.each do |posting|
        if posting.pairings.nil? || posting.pairings.empty?
          @unmatched_postings << posting
        else
          @pairings += posting.pairings # movies posted by current user accepted by other users
        end
      end
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
