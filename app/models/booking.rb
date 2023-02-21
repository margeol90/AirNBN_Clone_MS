class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :flat
  has_one :review

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :adults, :children, presence: true
end
