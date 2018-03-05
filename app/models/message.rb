class Message < ApplicationRecord
  belongs_to :pairing
  belongs_to :user
end
