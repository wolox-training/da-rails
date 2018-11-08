class RentExpirationJob
  include Sidekiq::Worker
  def perform
    rents = Rent.where('end_date = ?', Time.now)
    rents.each do |rent|
      RentMailer.rent_expire(rent).deliver_later
      puts 'sending'
    end

    puts 123123
  end
end