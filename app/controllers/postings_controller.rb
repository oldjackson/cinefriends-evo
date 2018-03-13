class PostingsController < ApplicationController
  before_action :set_posting, only: [:destroy]
  # before_action :user, only: [:destroy]

  # def new
  #   @posting = Posting.new
  # end

  # def create
  #   @posting = Posting.new(posting_params)
  #   @posting.save
  # end

  # def request
  #   @request = Posting.new(set_posting_params)
  # end

  def destroy
    @posting.destroy
    redirect_to dashboard_path
  end

  private

  def set_posting
    @posting = Posting.find(params[:id])
    unless @posting.user == current_user
      redirect_to dashboard_path, alert: "You cannot act on this posting."
    end
  end

  # def show
  #   @show = Show.find(params[:show_id])
  # end

  # def user
  #   @user = current_user
  # end

end
