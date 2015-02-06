class Item < ActiveRecord::Base

  # Associations
  belongs_to :item_classification
  belongs_to :supplier
  belongs_to :bid

  # Filters
  #


  # Configs
  monetize :valor_unitario_cents, as: 'valor_unitario' #https://github.com/RubyMoney/money-rails

end
