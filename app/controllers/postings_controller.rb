class PostingsController < ApplicationController
    before_action :user

  def new
    @posting = Posting.new
  end

  def create
    @posting = Posting.new(posting_params)
    @posting.save
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def posting_params
  end

  def user
    @user = current_user
  end

end
