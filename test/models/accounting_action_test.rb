# == Schema Information
#
# Table name: accounting_actions
#
#  id          :integer          not null, primary key
#  codigo      :string(255)
#  descricao   :string(255)
#  exercise_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class AccountingActionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
