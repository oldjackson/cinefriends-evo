class Posting < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  belongs_to :theater
  validates :first_time, presence: true
  validates :last_time, presence: true
  validates :first_date, presence: true
  validates :last_date, presence: true
  validates :status, inclusion: {in: %w(pending accepted declined)}
end
