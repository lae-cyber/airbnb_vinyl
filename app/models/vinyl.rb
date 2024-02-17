class Vinyl < ApplicationRecord
  has_many :bookings
  belongs_to :user
  has_one_attached :photo
  validates :genre, inclusion: { in: ['indie-rock', 'electro', 'pop'] }
end
