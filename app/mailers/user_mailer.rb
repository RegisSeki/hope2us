class UserMailer < ApplicationMailer
  def donation_mailer(user, donations)
    @donations = donations
    @user = user
    @url = 'http://localhost:3000/donations/confirmation'
    mail(to: @user.email, subject: 'Obrigado! Hope2us')
  end
end
