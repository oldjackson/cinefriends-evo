class Pairing < ApplicationRecord
  belongs_to :posting
  belongs_to :show
  belongs_to :user
  has_many :messages
end
