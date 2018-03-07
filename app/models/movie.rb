class Movie < ApplicationRecord
  has_many :shows, dependent: :destroy
  has_many :theaters, through: :shows
  has_many :pairings, through: :shows
  has_many :postings

  mount_uploader :poster, PhotoUploader

  validates :title, presence: true

  include PgSearch
  pg_search_scope :search,
    against: [ :title, :director ],
    associated_against: {
      theaters: [ :name, :location ]
    },
    using: {
      tsearch: { prefix: true }
    }
  pg_search_scope :search_by_title,
    against: [ :title ],
    using: {
      tsearch: { prefix: true }
    }
  pg_search_scope :search_by_director,
    against: [ :director ],
    using: {
      tsearch: { prefix: true }
    }
  pg_search_scope :search_by_location,
    associated_against: {
      theaters: [ :location ]
    },
    using: {
      tsearch: { prefix: true }
    }
end
