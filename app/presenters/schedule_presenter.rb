class SchedulePresenter < BasePresenter
  attr_reader :device

  def initialize(device)
    @device = device
  end

  def present
    return {} unless device.schedule

    {
      schedule: present_scheduled_media
    }
  end

  private

  def present_scheduled_media
    device.schedule.scheduled_media.map do |scheduled_media|
      {
        times_per_hour: scheduled_media.times_per_hour,
        **present_media(scheduled_media.media)
      }
    end
  end

  def present_media(media)
    MediaPresenter.new(media).present
  end
end
