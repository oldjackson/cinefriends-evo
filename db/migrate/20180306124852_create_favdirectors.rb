class CreateFavdirectors < ActiveRecord::Migration[5.1]
  def change
    create_table :favdirectors do |t|
      t.string :name

      t.timestamps
    end
  end
end
