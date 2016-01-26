class StockroomRemoval < ActiveRecord::Base

  # Associations
  belongs_to :user
  has_many :stockroom_removal_items, dependent: :destroy, autosave: true
  has_many :stockroom_items, through: :stockroom_removal_items

  # Cocoon
  accepts_nested_attributes_for :stockroom_items
  accepts_nested_attributes_for :stockroom_removal_items, reject_if: :all_blank, allow_destroy: true

  # Validations
  validates :user, presence: true

end
