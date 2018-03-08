class Show < ApplicationRecord
  belongs_to :movie
  belongs_to :theater
  has_many :postings, dependent: :destroy

  validates :date, presence: true
  validates :time, presence: true
end
