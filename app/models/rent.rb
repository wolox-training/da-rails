class Rent < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :end_date,presence: true
  validate :validate_dates

  def validate_dates
    errors.add(:init_date, 'The date should be more greater than the end date') if init_date > end_date  
  end
end
