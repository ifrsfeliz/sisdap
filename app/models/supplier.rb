# == Schema Information
#
# Table name: suppliers
#
#  id           :integer          not null, primary key
#  cnpj         :string(255)
#  razao_social :string(255)
#  email        :string(255)
#  telefone     :string(255)
#  celular      :string(255)
#  contato      :string(255)
#  observacoes  :text(65535)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Supplier < ActiveRecord::Base
  has_and_belongs_to_many :supplier_groups
  
  def list_supplier_groups
    supplier_groups.map(&:nome).join(', ')
  end
end
