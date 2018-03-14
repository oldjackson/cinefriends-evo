class PostingsController < ApplicationController
  before_action :set_posting, only: [:destroy]
  before_action :user

  # def new
  #   @posting = Posting.new
  # end

  def create
    @posting = Posting.new()
    @posting.user = @user
    @posting.show_id = params[:show_time]
# binding.pry
    if @posting.save
      # respond_to do |format|
      #   format.html {
         # redirect_to movie_path(@posting.show.movie), notice: "Your posting is now active!"
         redirect_to movie_path(@posting.show.movie), notice: "Your posting is now active!"
       # }
       #  format.js  # <-- will render `app/views/reviews/create.js.erb`
      # end
    else
      # respond_to do |format|
        # format.html {
          redirect_to movie_path(@posting.show.movie), alert: @posting.errors.messages[:show][0]
        # }
        # format.js  # <-- idem
      # end
    end

  end

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

  def set_show
    @show = Show.find(params[:show_id])
  end

  def user
    @user = current_user
  end

end
