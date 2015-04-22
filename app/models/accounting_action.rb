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

class AccountingAction < ActiveRecord::Base
  belongs_to :exercise
end
