class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :flat
  has_one :review, dependent: :destroy

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :adults, :children, presence: true
  validate :end_date_after_start_date

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end
end
