class Flat < ApplicationRecord
  belongs_to :user

  validates :name, :user_id, presence: true, uniqueness: true
  validates :rooms, :price, presence: true
end
