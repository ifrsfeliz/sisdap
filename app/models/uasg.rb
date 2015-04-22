# == Schema Information
#
# Table name: uasgs
#
#  id         :integer          not null, primary key
#  codigo     :string(255)
#  nome       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Uasg < ActiveRecord::Base
  has_many :bids

  def full_name
    "#{codigo} - #{nome} "
  end
end
