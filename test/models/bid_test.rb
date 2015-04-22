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

require 'test_helper'

class BidTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
