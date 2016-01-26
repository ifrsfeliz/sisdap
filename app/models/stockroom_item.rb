class StockroomItem < ActiveRecord::Base
  has_many :stockroom_entries, dependent: :destroy
end
