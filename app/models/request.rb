# == Schema Information
#
# Table name: requests
#
#  id                       :integer          not null, primary key
#  qtd_solicitada           :integer
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  numero_do_empenho        :string(255)
#  classificacao_do_empenho :string(255)
#  fonte_do_empenho         :string(255)
#  data_empenho             :date
#  accounting_action_id     :integer
#  order_id                 :integer
#  item_id                  :integer
#  status                   :integer
#

class Request < ActiveRecord::Base

  # status
  AGUARDANDO_ENVIO                   = 1   # Aguardando envio do formuário para análise orçamentária (Solicitante)
  ENVIADO_PARA_ANALISE               = 2   # Enviado para análise orçamentária (Analista Orçamentário)
  PEDIDO_ACEITO                      = 3   # Pedido negado (Analista Orçamentário)
  PEDIDO_NEGADO                      = 4   # Pedido aceito (Analista Orçamentário)
  ENVIADO_PARA_COMPRAS               = 5   # Enviado ao setor de compras (Compras)
  ENVIADO_PARA_EMPENHO               = 6   # Enviado para empenho (Compras)
  EMPENHO_EFETUADO                   = 7   # Empenho efetuado (Financeiro)
  ENVIADO_PARA_ALMOXARIFADO          = 8   # Encaminhado para o almoxarifado dar continuidade no processo(Almoxarifado)
  EMPENHO_ENVIADO_AO_FORNECEDOR      = 9   # Empenho enviado ao fornecedor (Almoxarifado)
  RECEBIDO_PROVISORIAMENTE           = 10   # Item recebido provisoriamente (Almoxarifado)
  AGUARDANDO_RETIRADA                = 11  # Aguardando retirada do item no almoxarifado (Almoxarifado)
  ITEM_ENTREGUE_AO_SOLICITANTE       = 12  # Item entregue ao solicitante (Almoxarifado)
  FINALIZADO                         = 13  # Requisição Finalizada

  # Associations
  belongs_to :order
  belongs_to :item

end
