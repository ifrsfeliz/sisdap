class SystemMailer < ApplicationMailer

  def testar_envio_de_email
    mail(to: User.first.email, subject: "E-mail de teste do SisDAP")
  end
end
