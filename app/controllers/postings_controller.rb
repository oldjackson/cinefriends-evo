class PostingsController < ApplicationController
    before_action :set_posting_params, :user, only: [:show, :request]

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

  def user
    @user = current_user
  end

end
