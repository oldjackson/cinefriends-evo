class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]

  def index
    @movies = Movie.all
  end

  def show
    # needed to show the posting form along with the existing movie data in the view
    @postings = @movie.postings.reject { |p| p.user == current_user}

  end

  def new
    if user_signed_in?
      @movie = Movie.new
    else
      redirect_to root_path, alert: "To post a new movie for renting you need to sign in."
    end
  end

  def edit
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movie_path(@movie)
    else
      render :new
    end
  end

  def update
    if @movie.update(movie_params)
      redirect_to @movie
    else
      render :edit
    end
  end

  def destroy
    @movie.destroy
    redirect_to movies_path
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :director, :photo)
  end
end
