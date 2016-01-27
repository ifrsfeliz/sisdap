class StockroomItem < ActiveRecord::Base
  has_many :stockroom_movimentations, dependent: :destroy
  has_many :stockroom_removal_items, dependent: :destroy, autosave: true
end
