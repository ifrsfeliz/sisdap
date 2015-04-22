# == Schema Information
#
# Table name: bids
#
#  id               :integer          not null, primary key
#  uasg_id          :integer
#  numero           :string(255)
#  objeto_do_pregao :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Bid < ActiveRecord::Base

  # Associations
  belongs_to :uasg
  has_many :items

end
