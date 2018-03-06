class CreateShows < ActiveRecord::Migration[5.1]
  def change
    create_table :shows do |t|
      t.date :date
      t.time :time
      t.references :movie, foreign_key: true
      t.references :theater, foreign_key: true

      t.timestamps
    end
  end
end
