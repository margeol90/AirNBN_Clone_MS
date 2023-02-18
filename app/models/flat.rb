class Flat < ApplicationRecord
  has_one_attached :photo
  belongs_to :user

  validates :name, presence: true, uniqueness: true
  validates :rooms, :price, presence: true
end
