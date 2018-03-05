class PairingsController < ApplicationController
  before_action :user
  def new
    @pairing = Pairing.new
  end

  def create
    @pairing = Pairing.new(pairing_params)
    @pairing.save
  end

  private

  def pairing_params
  end

  def user
    @user = current_user
  end


end
