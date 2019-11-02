module Common::DashboardHelper
  def dashdoard_greeting
    t('common.dashboard.greetings', email: current_user.email)
  end

  def dashboard_statistics
    t('common.dashboard.devices_stats', devices_amount: Device.count, enabled_devices_amount: Device.enabled.count)
  end
end
