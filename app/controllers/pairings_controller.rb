class PairingsController < ApplicationController
  before_action :set_pairing, only: [:show]
  before_action :user

  def show
    @message = Message.new
    @sent_messages = @pairing.messages.where(user: current_user)
    @received_messages = @pairing.messages.where.not(user: current_user)

  end

  # def create
  #   @pairing = Pairing.new(pairing_params)
  #   @pairing.save
  # end

  private

  # def pairing_params
  # end

  def user
    @user = current_user
  end

  def set_pairing
    @pairing = Pairing.find(params[:id])
  end


end
