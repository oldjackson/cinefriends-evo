class AddStatusToPairings < ActiveRecord::Migration[5.1]
  def change
    add_column :pairings, :status, :boolean, default: false
  end
end
