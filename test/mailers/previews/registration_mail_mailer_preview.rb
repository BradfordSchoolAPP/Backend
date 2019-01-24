# Preview all emails at http://localhost:3000/rails/mailers/registration_mail_mailer
class RegistrationMailMailerPreview < ActionMailer::Preview

	
  # Preview this email at http://localhost:3000/rails/mailers/registration_mail_mailer/new_register
  def new_register
  	nico={name: "Nicolas",
		email: "nico.paredes05@gmail.com"
	}
    RegistrationMailMailer.new_register(nico,12345)
  end

end
