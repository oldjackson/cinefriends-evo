class MessagesController < ApplicationController
  before_action :user
  before_action :set_pairing , only: [ :create ]

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.pairing = @pairing
    @message.user = @user
    if @message.save
      redirect_to @pairing, notice: "Your message was sent"
    else
      redirect_to @pairing, alert: "Your message was not sent"
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  def set_pairing
    @pairing = Pairing.find(params[:pairing_id])
    unless @pairing.posting.user == current_user || @pairing.user == current_user
      redirect_to dashboard_path, alert: "The pairing you are trying to alter is not about any of your posting."
    end
  end

  def user
    @user = current_user
  end
end
