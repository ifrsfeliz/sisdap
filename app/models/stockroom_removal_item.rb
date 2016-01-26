class StockroomRemovalItem < ActiveRecord::Base

  # Associations
  belongs_to :stockroom_item, autosave: true
  belongs_to :stockroom_removal

  # Validations
  validates :stockroom_item_id, uniqueness: { scope: :stockroom_removal_id }
  validates :quantidade, numericality: { only_integer: true, :greater_than_or_equal_to => 1 }
  validates :quantidade, presence: true
  validates :stockroom_item_id, presence: true
  validate :presence_of_item_and_quantity

  accepts_nested_attributes_for :stockroom_removal, :reject_if => :all_blank, allow_destroy: true

  # Callbacks
  before_save :update_stockroom_item_quantity, prepend: true

  protected
  def presence_of_item_and_quantity
    if stockroom_item_id.nil?
      errors.add(:stockroom_item_id, "Um item deve ser selecionado.")
    elsif quantidade.nil?
      errors.add(:quantidade, "Quantidade Inválida.")
    elsif stockroom_item.quantidade.to_i < quantidade # os dois ifs acima é para evitar que essa condição quebre por serem nulos
      errors.add(:quantidade, "Não há quantidade disponível para este item.")
    end
  end

  def update_stockroom_item_quantity
    stockroom_item.quantidade -= quantidade
  end

end
