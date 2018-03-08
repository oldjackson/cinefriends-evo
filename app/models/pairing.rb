class Pairing < ApplicationRecord
  belongs_to :posting
  belongs_to :user
  has_many :messages

  validates :status, inclusion: {in: %w(pending accepted declined)}
end
