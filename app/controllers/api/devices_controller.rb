class Api::DevicesController < Api::BaseController
  before_action :find_device

  def schedule
    api_response ::SchedulePresenter.new(@device).present
  end

  def find_device
    @device = Device.find_by(internal_name: params[:device_internal_name]).tap do |device|
      raise(StandardError, 'Device not found') unless device
    end
  end
end
