class Review < ApplicationRecord
  belongs_to :flat

  validates :content, presence: true
end
