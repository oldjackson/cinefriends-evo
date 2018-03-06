class AddLocationToTheaters < ActiveRecord::Migration[5.1]
  def change
    add_column :theaters, :location, :string
  end
end
