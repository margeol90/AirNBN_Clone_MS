class Flat < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings

  validates :name, presence: true, uniqueness: true
  validates :rooms, :price, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
