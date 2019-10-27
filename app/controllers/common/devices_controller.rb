class Common::DevicesController < AuthenticatedController
  defaults resource_class: Device

  navigation_section :devices
end
