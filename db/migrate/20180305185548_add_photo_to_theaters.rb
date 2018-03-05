class AddPhotoToTheaters < ActiveRecord::Migration[5.1]
  def change
    add_column :theaters, :photo, :string
  end
end
