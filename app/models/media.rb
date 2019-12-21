# == Schema Information
#
# Table name: media
#
#  id            :bigint           not null, primary key
#  name          :string(255)      default(""), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  present_count :integer          default(0), not null
#

class Media < ApplicationRecord
  include UserActionsLoggable

  has_one_attached :file
  has_many :scheduled_media, dependent: :restrict_with_error, inverse_of: :media

  validates :name, presence: true
  validates :file, attached: true

  before_save :populate_file_name

  default_scope { order(created_at: :desc) }

  private

  def populate_file_name
    self.name = image.filename.base if name.blank?
  end
end
