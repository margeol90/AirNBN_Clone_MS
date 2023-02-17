class Flat < ApplicationRecord
  belongs_to :user

  validates :name, :rooms, :price, presence: true, uniqueness: true
end
