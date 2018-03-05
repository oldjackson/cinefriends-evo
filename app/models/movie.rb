class Movie < ApplicationRecord
  has_many: :shows, dependent: :destroy
  mount_uploader :poster, PhotoUploader
end
