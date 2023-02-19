class Flat < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
<<<<<<< HEAD
  has_many :reviews, dependent: :destroy
=======
  has_many :bookings

  validates :name, presence: true, uniqueness: true
  validates :rooms, :price, presence: true
>>>>>>> master
end
