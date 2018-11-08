class RentMailer < ApplicationMailer
  def rent_created(rent)
    @rent = rent
    mail(to: @rent.user.email, subject: I18n.t('mailer.rent_mailer.rent_created.subject'))
  end

  def rent_expire(rent)
    @rent = rent
    mail(to: @rent.user.email, subject: I18n.t("mailer.rent_mailer.rent_expire.subject"))
  end
end
