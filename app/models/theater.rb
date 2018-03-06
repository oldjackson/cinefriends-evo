class Theater < ApplicationRecord
  has_many :shows, dependent: :destroy
  mount_uploader :photo, PhotoUploader

  validates :name, presence: true
  validates :location, presence: true
end
