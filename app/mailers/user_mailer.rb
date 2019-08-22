class UserMailer < ApplicationMailer
  default from: 'wbooksapi-27@wolox.com.ar'

  def notice_email(rent)
    @rent = rent
    @book = rent.book
    mail(to: 'franco.perez@wolox.com.ar', subject: 'Rent Notification')
  end
end
