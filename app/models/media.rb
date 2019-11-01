# == Schema Information
#
# Table name: media
#
#  id         :bigint           not null, primary key
#  name       :string(255)      default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Media < ApplicationRecord
  has_one_attached :file
  has_many :scheduled_media, dependent: :restrict_with_error, inverse_of: :media

  # TODO: Add uploaded file presence validation
  validates :name, presence: true

  before_save :fetch_file_name

  private

  def fetch_file_name
    self.name = image.filename.base if name.blank?
  end
end
