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
  # Callbacks
  after_update :add_request_log_about_status_change, :if => Proc.new {|a| a.status_changed?}

  # CONSTANTS
  AGUARDANDO_ENVIO              = 1   # Aguardando envio do formuário para análise orçamentária (Solicitante)
  PEDIDO_ACEITO                 = 2   # Pedido aceito (Analista Orçamentário)
  ENVIADO_PARA_COMPRAS          = 3   # Enviado ao setor de compras (Compras)
  ENVIADO_PARA_EMPENHO          = 4   # Enviado para empenho (Compras)
  EMPENHO_EFETUADO              = 5   # Empenho efetuado (Financeiro)
  ENVIADO_PARA_ALMOXARIFADO     = 6   # Encaminhado para o almoxarifado dar continuidade no processo(Almoxarifado)
  EMPENHO_ENVIADO_AO_FORNECEDOR = 7   # Empenho enviado ao fornecedor (Almoxarifado)
  RECEBIDO_PROVISORIAMENTE      = 8   # Item recebido provisoriamente (Almoxarifado)
  AGUARDANDO_RETIRADA           = 9   # Aguardando retirada do item no almoxarifado (Almoxarifado)
  ITEM_ENTREGUE_AO_SOLICITANTE  = 10  # Item entregue ao solicitante (Almoxarifado)
  FINALIZADO                    = 11  # Requisição Finalizada
  PEDIDO_NEGADO                 = 12  # Pedido negado (Analista Orçamentário)

  STATUS = { 1  => "Aguardando envio do formuário para análise orçamentária",
             2  => "Pedido aceito",
             3  => "Enviado ao setor de compras",
             4  => "Enviado para empenho",
             5  => "Empenho efetuado",
             6  => "Encaminhado para o almoxarifado dar continuidade no processo",
             7  => "Empenho enviado ao fornecedor",
             8  => "Item recebido provisoriamente",
             9  => "Aguardando retirada do item no almoxarifado",
             10 => "Item entregue ao solicitante",
             11 => "Requisição finalizada",
             12 => "Pedido negado" }

  # Associations
  belongs_to :order
  belongs_to :item
  belongs_to :accounting_action
  belongs_to :action_plan
  has_many :request_logs, dependent: :destroy




  def status_detalhado
    STATUS[self.status]
  end

  def add_request_log_about_status_change
    self.request_logs.create(description: "O status foi alterado de <strong>#{STATUS[self.status_was]}</strong> para <strong>#{STATUS[self.status]}</strong>")
  end


end
