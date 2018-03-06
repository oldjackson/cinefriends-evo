class User < ApplicationRecord

  mount_uploader :photo, PhotoUploader

  has_many :genre_users
  has_many :genres, through: :genre_users
  has_many :favdirector_users
  has_many :favdirectors, through: :favdirector_users
  has_many :favmovie_users
  has_many :favmovies, through: :favmovie_users
  has_many :messages
  has_many :postings, dependent: :destroy
  has_many :pairings

  validates :first_name, presence: true
  validates :last_name, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
