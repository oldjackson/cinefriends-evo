class Favdirector < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
