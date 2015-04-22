# == Schema Information
#
# Table name: items
#
#  id                     :integer          not null, primary key
#  item                   :integer
#  item_classification_id :integer
#  descricao              :text(65535)
#  supplier_id            :integer
#  validade               :date
#  unidade                :string(255)
#  quantidade             :integer
#  valor_unitario_cents   :integer
#  tipo                   :string(255)
#  observacao             :text(65535)
#  ativo                  :boolean
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  bid_id                 :integer
#  qtd_disponivel         :integer
#

require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
