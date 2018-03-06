class CreateFavmovies < ActiveRecord::Migration[5.1]
  def change
    create_table :favmovies do |t|
      t.string :title

      t.timestamps
    end
  end
end
