class RemoveCityFromTheaters < ActiveRecord::Migration[5.1]
  def change
    remove_column :theaters, :city, :string
  end
end
