class Flat < ApplicationRecord
  belongs_to :user

  validates :name, uniqueness: true
  validates :rooms, :price, presence: true
end
