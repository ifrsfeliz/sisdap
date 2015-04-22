# == Schema Information
#
# Table name: action_plans
#
#  id          :integer          not null, primary key
#  exercise_id :integer
#  nome        :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  setor       :string(255)
#

require 'test_helper'

class ActionPlanTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
