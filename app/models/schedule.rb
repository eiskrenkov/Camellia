# == Schema Information
#
# Table name: schedules
#
#  id         :bigint           not null, primary key
#  name       :string(255)      default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#

class Schedule < ApplicationRecord
  belongs_to :user, class_name: 'User'
  has_one :device, class_name: 'Device', dependent: :restrict_with_error

  has_many :scheduled_media, dependent: :restrict_with_error, inverse_of: :schedule
  accepts_nested_attributes_for :scheduled_media, allow_destroy: true

  # TODO: Validations
end
