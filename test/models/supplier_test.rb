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

require 'test_helper'

class SupplierTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
