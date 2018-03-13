class AddAboutToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :fav_quote, :string
    add_column :users, :about_me, :text
  end
end
