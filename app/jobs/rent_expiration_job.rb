class RentExpirationJob
  include Sidekiq::Worker
  def perform
    rents = Rent.where('end_date = ?', Time.zone.now)
    rents.each do |rent|
      RentMailer.rent_expire(rent).deliver_later
    end
  end
end
