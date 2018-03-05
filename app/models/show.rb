class Show < ApplicationRecord
  belongs_to :movie
  belongs_to :theater

  validates :date, presence: true
  validates :time, presence: true
end
