class Rent < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :end_date, :init_date, presence: true
  validate :validate_dates

  def validate_dates
    return true if init_date < end_date

    errors.add(:init_date, 'The date should be more greater than the end date')
  end
end
