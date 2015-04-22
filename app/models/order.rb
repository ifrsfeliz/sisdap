class Order < ActiveRecord::Base
  # Associations
  has_many :requests, dependent: :destroy
  belongs_to :user


end
