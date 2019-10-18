class Rent < ApplicationRecord
  belongs_to :user, counter_cache: true
  belongs_to :book
  validates :end_date, :init_date, presence: true, allow_blank: false
  validate :validate_dates

  def validate_dates
    return false if init_date.nil? || end_date.nil?
    return true if init_date < end_date

    errors.add(:init_date, 'The date should be more greater than the end date')
  end
end
