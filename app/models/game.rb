class Game < ApplicationRecord
  has_many :favourites, dependent: :destroy
  has_many :users, through: :favourites

  validates :title, presence: true, uniqueness: true
  validates_presence_of :description, :image, :genre
end
