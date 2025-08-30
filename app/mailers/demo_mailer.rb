class DemoMailer < ApplicationMailer


	default from: 'fnaeem7171@gmail.com'


	def welcome_email
    mail(
      to: "fnaeem7171@gmail.com",
      subject: 'Welcome to Rails 7. StartKit'
    )
  end

end
