# == Schema Information
#
# Table name: supplier_groups
#
#  id         :integer          not null, primary key
#  nome       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class SupplierGroup < ActiveRecord::Base
  has_and_belongs_to_many :suppliers
end
