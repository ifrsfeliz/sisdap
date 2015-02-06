class Bid < ActiveRecord::Base

  # Associations
  belongs_to :uasg
  has_many :items

end
