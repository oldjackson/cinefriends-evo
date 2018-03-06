class FavmovieUser < ApplicationRecord
  belongs_to :user
  belongs_to :favmovie
end
