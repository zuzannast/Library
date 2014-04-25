class UserMailer < ActionMailer::Base
  default from: "library_ZS_MZ@no-reply.com"

  def reminder(user)
    @user = user
    @reservations = user.reservations

    mail(to: @user.email, subject: 'Reminder from Library ZS&MZ')
  end
end
