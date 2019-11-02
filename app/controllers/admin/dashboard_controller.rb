class Admin::DashboardController < AdminController
  defaults resource_class: User

  navigation_section :admin_dashboard
end
