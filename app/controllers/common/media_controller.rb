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

  def media_params
    params.require(:media).permit(:name, :file)
  end
end
