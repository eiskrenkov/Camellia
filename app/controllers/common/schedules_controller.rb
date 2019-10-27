class Common::SchedulesController < AuthenticatedController
  defaults resource_class: Schedule

  navigation_section :schedules
end
