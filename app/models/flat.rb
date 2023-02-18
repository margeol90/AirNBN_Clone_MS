class Flat < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :bookings

  validates :name, :user_id, presence: true, uniqueness: true
  validates :rooms, :price, presence: true
end
