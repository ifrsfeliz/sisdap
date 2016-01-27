class StockroomMovimentation < ActiveRecord::Base
  # Associations
  belongs_to :stockroom_item, autosave: true
  belongs_to :user # quando é saída
  has_many :stockroom_removal_items, dependent: :destroy, autosave: true
  has_many :stockroom_items, through: :stockroom_removal_items

  enum tipo_movimentacao: [:entry, :removal]

  # Cocoon
  accepts_nested_attributes_for :stockroom_items
  accepts_nested_attributes_for :stockroom_removal_items, reject_if: :all_blank, allow_destroy: true

  # Configs
  monetize :valor_unitario_cents, as: 'valor_unitario', :disable_validation => true #https://github.com/RubyMoney/money-rails
end
