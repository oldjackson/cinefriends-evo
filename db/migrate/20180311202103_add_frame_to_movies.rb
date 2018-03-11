class AddFrameToMovies < ActiveRecord::Migration[5.1]
  def change
    add_column :movies, :frame, :string
  end
end
