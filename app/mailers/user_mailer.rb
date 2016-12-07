class UserMailer < ApplicationMailer
 	default from: 'notifications@example.com'

 	def donation_mailer(user, donations)
 		@donations = donations
 		@user = user
 		@url = 'Definir URL'
 		mail(to: @user.email, subject: 'Obrigado! Hope2us')
 	end
end
