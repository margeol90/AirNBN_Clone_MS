class Flat < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :rooms, :price, presence: true
end
