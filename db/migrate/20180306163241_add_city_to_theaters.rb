class AddCityToTheaters < ActiveRecord::Migration[5.1]
  def change
    add_column :theaters, :city, :string
  end
end
