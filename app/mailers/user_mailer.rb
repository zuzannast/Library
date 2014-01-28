class UserMailer < ActionMailer::Base
  default from: "library@lno-reply.com"
  # Subject can be set in your I18n file at config/locales/en.yml with the following lookup:
  #
  #   en.user_mailer.przypomnienie.subject
  #
  def reminder(user)
    @user = user
    @reservations = user.reservations

    mail(to: @user.email, subject: 'Reminder')
  end
end
