# == Schema Information
#
# Table name: devices
#
#  id         :bigint           not null, primary key
#  name       :string(255)      default(""), not null
#  status     :string(255)      default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#

class Device < ApplicationRecord
  belongs_to :user, class_name: 'User'

  has_enumeration_for :status, with: ::DeviceStatus, create_scopes: true, create_helpers: true, required: true
end
