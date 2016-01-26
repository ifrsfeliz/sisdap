class StockroomEntry < ActiveRecord::Base
  # Associations
  belongs_to :stockroom_item, autosave: true

  # Configs
  monetize :valor_unitario_cents, as: 'valor_unitario' #https://github.com/RubyMoney/money-rails
end
