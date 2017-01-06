# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  invitation_token       :string
#  invitation_created_at  :datetime
#  invitation_sent_at     :datetime
#  invitation_accepted_at :datetime
#  invitation_limit       :integer
#  invited_by_type        :string
#  invited_by_id          :integer
#  invitations_count      :integer          default(0)
#  phone_number           :string
#  title                  :string
#  name                   :string
#  time_zone              :string           default("Central Time (US & Canada)")
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :events
  has_and_belongs_to_many :roles

  before_validation :set_role

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  def set_role
    roles << Role.where(name: 'gmc').first_or_create unless roles # default role
    roles = roles.reject { |r| r.name == 'gmc'} if roles && roles.pluck(:name).include?('poc')
  end

  def cadre?
    roles.pluck(:name).include?('cadre')
  end

  def admin?
    roles.pluck(:name).include?('admin')
  end

  def gmc?
    roles.pluck(:name).include?('gmc') ||
    roles.pluck(:rotc_class).include?('gmc')
  end

  def flight_cc?
    roles.pluck(:name).include?('flight') && roles.pluck(:cc).include?(true)
  end
end
