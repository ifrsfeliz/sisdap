class Uasg < ActiveRecord::Base
  has_many :bids

  def full_name
    "#{codigo} - #{nome} "
  end
end
