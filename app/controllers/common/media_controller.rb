class Common::MediaController < AuthenticatedController
  defaults resource_class: Media

  navigation_section :media

  def create
    create! { collection_path }
  end

  def update
    update! { collection_path }
  end

  private

  def permitted_params
    params.permit(media: %i[name file])
  end
end
