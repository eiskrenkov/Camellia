class Common::MediaController < AuthenticatedController
  defaults resource_class: Media

  navigation_section :media
end
