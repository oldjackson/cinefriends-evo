class PairingsController < ApplicationController
  before_action :user
  before_action :set_posting, only: [:create, :edit]
  before_action :set_pairing, only: [:decline, :accept]

  def new
    @pairing = Pairing.new
  end

  def create
    @pairing = Pairing.new(posting: @posting, user: @user)
    @pairing.save
  end

  private

  def user
    @user = current_user
  end

  def set_posting
    @posting = Posting.find(params[:posting_id])
  end

  def set_pairing
    @pairing = Pairing.find(params[:id])
    if @pairing.posting.user != current_user
      redirect_to dashboard_path, alert: "The pairing you are trying to alter is not about any of your posting."
    end
  end

end
