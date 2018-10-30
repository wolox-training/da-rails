class RentMailer < ApplicationMailer

  def rent_created (rent)
    @rent = rent
    mail(to: @rent.user.email, subject: 'sending a confirm rent email')
  end
end
