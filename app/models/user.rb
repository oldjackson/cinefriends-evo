class User < ApplicationRecord

  mount_uploader :photo, PhotoUploader

  has_many :genre_users
  has_many :genres, through: :genre_users
  has_many :messages
  has_many :postings, dependent: :destroy
  has_many :pairings
  has_many :genres, through: :genre_users
  validates :first_name, presence: true
  validates :last_name, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
