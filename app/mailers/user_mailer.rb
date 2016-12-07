class UserMailer < ApplicationMailer
  default from: 'contato.hope2us@gmail.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'A Hope2us agradece pela doação :)')
  end
end
