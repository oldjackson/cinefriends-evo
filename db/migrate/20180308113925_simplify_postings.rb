class SimplifyPostings < ActiveRecord::Migration[5.1]
  def change
    remove_reference :postings, :movie, foreign_key: true
    remove_reference :postings, :theater, foreign_key: true
    add_reference :postings, :show, foreign_key: true
    add_column :postings, :active, :boolean, default: true
    remove_column :postings, :status
    remove_column :postings, :first_date
    remove_column :postings, :last_date
    remove_column :postings, :first_time
    remove_column :postings, :last_time
  end
end
