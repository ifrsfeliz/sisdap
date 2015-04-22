# == Schema Information
#
# Table name: requests
#
#  id                       :integer          not null, primary key
#  qtd_solicitada           :integer
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  numero_do_empenho        :string(255)
#  classificacao_do_empenho :string(255)
#  fonte_do_empenho         :string(255)
#  data_empenho             :date
#  accounting_action_id     :integer
#  order_id                 :integer
#  item_id                  :integer
#  status                   :integer
#

require 'test_helper'

class RequestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
