class StockroomItem < ActiveRecord::Base
  has_many :stockroom_entries, dependent: :destroy
  has_many :stockroom_removal_items, dependent: :destroy
end
