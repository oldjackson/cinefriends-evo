class PairingsController < ApplicationController
  before_action :user
  before_action :set_posting, only: [:create, :edit]
  before_action :set_pairing, only: [:show, :decline, :accept]

  def show
    @message = Message.new
    @sent_messages = @pairing.messages.where(user: current_user)
    @received_messages = @pairing.messages.where.not(user: current_user)
  end

  def new
    @pairing = Pairing.new
  end

  def create
    # binding.pry
    @pairing = Pairing.new(posting: @posting, user: @user)
    if @pairing.save
      redirect_to pairing_path(@posting)
    else
      redirect_to movie_path(@posting.movie)
    end
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

  def set_show
    @show = Show.find(params[:show_id])
  end

end
