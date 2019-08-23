class UserMailer < ApplicationMailer
  default from: 'wbooksapi-27@wolox.com.ar'

  def notice_email(rent)
    @rent = rent
    user = rent.user
    @book = rent.book
    I18n.with_locale(user.locale) do
      mail(to: 'franco.perez@wolox.com.ar', subject: 'No vimo')
    end
  end
end
