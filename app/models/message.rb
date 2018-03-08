class Message < ApplicationRecord
  belongs_to :pairing
  belongs_to :user
  validates :content, presence: true
end
