class RemoveFavoriteMoviesFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :favorite_movies, :text
  end
end
