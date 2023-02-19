class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :flat, dependent: :destroy_async

  validates :start_date, presence: true
  validates :end_date, presence: true
end
