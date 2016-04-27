class StockroomMailer < ApplicationMailer

  def notificacao_de_retirada_de_itens(stockroom_removal)
    @stockroom_removal = stockroom_removal
    mail :to => @stockroom_removal.user.email, :subject => "Notificação de retirada de itens do Almoxarifado"
  end

  def notificacao_de_entrada_de_item(stockroom_entry)
    @stockroom_entry = stockroom_entry
    dap_emails = Role.find_by(name: 'dap').users.map(&:email)
    mail :to => dap_emails, :subject => "Notificação de entrada de item no Almoxarifado"
  end

end
