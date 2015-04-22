# == Schema Information
#
# Table name: exercises
#
#  id         :integer          not null, primary key
#  nome       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Exercise < ActiveRecord::Base
  has_many :accounting_actions
  has_many :action_plans
end
