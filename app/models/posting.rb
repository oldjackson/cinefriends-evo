class Posting < ApplicationRecord
  belongs_to :user
  belongs_to :show
  has_many :pairings, dependent: :destroy
end
