# == Schema Information
#
# Table name: devices
#
#  id         :integer          not null, primary key
#  name       :string(255)      default(""), not null
#  status     :string(255)      default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Device < ApplicationRecord
end
