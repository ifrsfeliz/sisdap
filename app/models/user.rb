# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  admin_authorization    :boolean
#

class User < ActiveRecord::Base

  before_create :set_default_role

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_and_belongs_to_many :roles
  has_many :orders
  has_many :request_logs

  def role?( role )
    !roles.find_by_name( role.to_s ).nil?
  end

  def list_roles
    roles.map(&:name).join(', ')
  end

  private
  def set_default_role
    if self.roles.empty? 
      self.roles << Role.find_by_name('solicitante')
    end
  end
end
