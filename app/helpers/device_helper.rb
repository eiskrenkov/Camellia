module DeviceHelper
  def device_status_badge(device)
    class_mapping = {
      DeviceStatus::ENABLED => 'badge-success',
      DeviceStatus::DISABLED => 'badge-danger'
    }

    status = device.status
    content_tag(:span, status.upcase, class: "badge #{class_mapping[status]}")
  end
end
