class CreateFavmovieUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :favmovie_users do |t|
      t.references :user, foreign_key: true
      t.references :favmovie, foreign_key: true

      t.timestamps
    end
  end
end
