class MessagesController < ApplicationController
  before_action :user

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.save
  end

  private

  def message_params
  end

  def user
    @user = current_user
  end
end
