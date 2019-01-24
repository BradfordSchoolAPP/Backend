class RegistrationMailMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.registration_mail_mailer.new_register.subject
  #
  def new_register(user,pin)
    @pin=pin
    @user=user
    mail(to: @user.email, subject: '[Solicitud acceso] Aplicación appBradfordSchool.',
    	delivery_method_options: { api_key: '3b21426f917f2db7a4378ae29764302e', secret_key: '4bc481dd86d5a46b155b7572ba14ea76' }
    	)
  end
end
