# == Schema Information
#
# Table name: media
#
#  id         :integer          not null, primary key
#  name       :string(255)      default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Media < ApplicationRecord
  has_one_attached :file
end
