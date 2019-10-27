class Common::DashboardController < AuthenticatedController
  defaults resource_class: User

  navigation_section :dashboard
end
