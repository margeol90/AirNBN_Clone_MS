class Review < ApplicationRecord
  has_one :booking
  has_one :flat, through: :booking

  validates :content, presence: true
end
