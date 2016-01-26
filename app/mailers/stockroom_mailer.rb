class StockroomMailer < ApplicationMailer

  def notificacao_de_retirada_de_itens(stockroom_removal)
    @stockroom_removal = stockroom_removal
    mail :to => @stockroom_removal.user.email, :subject => "Notificação de retirada de itens do Almoxarifado"
  end

end
