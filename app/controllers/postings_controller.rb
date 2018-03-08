class PostingsController < ApplicationController
    before_action :set_posting_params
    before_action :user, only: [:show, :request]
    before_action

  # def new
  #   @posting = Posting.new
  # end

  # def create
  #   @posting = Posting.new(posting_params)
  #   @posting.save
  # end

  def request
    @request = Posting.new(set_posting_params)
  end

  private

  def set_posting_params
    @posting = Posting.find(params[:id])
  end

  def show
    @show = Show.find(params[:show_id])
  end

  def user
    @user = current_user
  end

end
