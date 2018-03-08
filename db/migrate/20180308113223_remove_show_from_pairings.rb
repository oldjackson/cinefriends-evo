class RemoveShowFromPairings < ActiveRecord::Migration[5.1]
  def change
    remove_reference :pairings, :show, foreign_key: true
    change_column :pairings, :status, :string, default: "pending"
  end
end
