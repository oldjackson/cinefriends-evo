class Movie < ApplicationRecord
  has_many :shows, dependent: :destroy
  has_many :theaters, through: :shows

  mount_uploader :poster, PhotoUploader

  validates :title, presence: true

  include PgSearch
  pg_search_scope :search,
    against: [ :title, :director ],
    associated_against: {
      theater: [ :name, :location ]
    },
    using: {
      tsearch: { prefix: true }
    }
end
