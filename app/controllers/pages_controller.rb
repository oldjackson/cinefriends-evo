class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def billboard
    # binding.pry
    if params[:search].nil? || params[:search].strip.empty?
      @local_movies = Movie.search({location: current_user.city}) unless current_user.city.nil?
      @fav_movies = []
      current_user.favmovies.each do |movie|
        @fav_movies << Movie.search({title: movie.title})
      end
      @fav_dir_movies = []
      current_user.favdirectors.each do |director|
        @fav_dir_movies << Movie.search({director: director.name})
      end
    else
      @movies = Movie.search(params[:search])
    end
  end
end
