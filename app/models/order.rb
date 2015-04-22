# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Order < ActiveRecord::Base
  # Associations
  has_many :requests, dependent: :destroy
  belongs_to :user


end
