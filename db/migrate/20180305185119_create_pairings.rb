class CreatePairings < ActiveRecord::Migration[5.1]
  def change
    create_table :pairings do |t|
      t.references :posting, foreign_key: true
      t.references :show, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
