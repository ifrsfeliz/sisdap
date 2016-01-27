namespace :system do

  desc "Envia e-mail de teste"
  task testar_envio_de_email: :environment do
    SystemMailer.testar_envio_de_email.deliver_now
  end

end

