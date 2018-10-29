class Rent < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :end_date, presence: true
  validate :validate_dates

  def validate_dates
    if init_date > end_date
      errors.add(:init_date, 'The date should be more greater than the end date')
    else
      true
    end
  end
end
