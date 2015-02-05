class Supplier < ActiveRecord::Base
  has_and_belongs_to_many :supplier_groups
  
  def list_supplier_groups
    supplier_groups.map(&:nome).join(', ')
  end
end
