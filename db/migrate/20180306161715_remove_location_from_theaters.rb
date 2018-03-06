class RemoveLocationFromTheaters < ActiveRecord::Migration[5.1]
  def change
    remove_column :theaters, :location, :string
  end
end
