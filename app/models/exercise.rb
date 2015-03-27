class Exercise < ActiveRecord::Base
  has_many :accounting_actions
  has_many :action_plans
end
