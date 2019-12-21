# == Schema Information
#
# Table name: users
#
#  id                 :bigint           not null, primary key
#  email              :string(255)      default(""), not null
#  encrypted_password :string(255)      default(""), not null
#  admin              :boolean          default(FALSE), not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class User < ApplicationRecord
  include ApplicationContextAccess

  define_context_access :current_user

  devise :database_authenticatable, :validatable

  alias_attribute :is_admin?, :admin

  has_many :devices, class_name: 'Device', dependent: :destroy
  has_many :schedules, class_name: 'Schedule', dependent: :destroy
end
