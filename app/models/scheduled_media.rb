# == Schema Information
#
# Table name: scheduled_media
#
#  id             :bigint           not null, primary key
#  times_per_hour :integer          default(1), not null
#  media_id       :bigint
#  schedule_id    :bigint
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class ScheduledMedia < ApplicationRecord
  belongs_to :schedule, inverse_of: :scheduled_media
  belongs_to :media, inverse_of: :scheduled_media

  # TODO: Validations
end
