class FavdirectorUser < ApplicationRecord
  belongs_to :user
  belongs_to :favdirector
end
