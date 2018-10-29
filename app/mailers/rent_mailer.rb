class RentMailer < ApplicationMailer

  def rent_created
    @email_to = ENV['MAILER_DOMAIN']
    mail(to: @email_to, subject: 'Sending a confirma mail')

  end
end
