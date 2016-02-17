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

  # Validations
  validates :quantidade, presence: true, if: :entry?
  validates :valor_unitario, presence: true, if: :entry?
  validates :stockroom_item, presence: true, if: :entry?
  validates :justificativa, presence: true, if: Proc.new{|sm| sm.entry? && sm.numero_empenho.blank? || sm.numero_processo.blank? }

  validates :user, presence: true, if: :removal?
  validates :stockroom_removal_items, presence: true, if: :removal?

  #Scopes
  scope :created_between, -> (start_date, end_date) { where("created_at >= ? AND created_at <= ?", start_date.beginning_of_day, end_date.end_of_day ) }

  # Override removal enum scope
  def self.removal
    self.where(tipo_movimentacao: StockroomMovimentation.tipo_movimentacaos[:removal]).order(created_at: :desc)
  end

end
