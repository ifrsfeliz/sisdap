# == Schema Information
#
# Table name: items
#
#  id                     :integer          not null, primary key
#  item                   :integer
#  item_classification_id :integer
#  descricao              :text(65535)
#  supplier_id            :integer
#  validade               :date
#  unidade                :string(255)
#  quantidade             :integer
#  valor_unitario_cents   :integer
#  tipo                   :string(255)
#  observacao             :text(65535)
#  ativo                  :boolean
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  bid_id                 :integer
#  qtd_disponivel         :integer
#

class Item < ActiveRecord::Base # ITENS HOMOLOGADOS

  # Associations
  belongs_to :item_classification
  belongs_to :supplier
  belongs_to :bid
  has_many :requests, dependent: :destroy
  has_many :orders, through: :requests, dependent: :destroy

  # Filters
  #


  # Configs
  monetize :valor_unitario_cents, as: 'valor_unitario' #https://github.com/RubyMoney/money-rails

end
