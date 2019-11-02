class Common::DevicesController < AuthenticatedController
  defaults resource_class: Device

  navigation_section :devices

  def create
    create! { collection_path }
  end

  def update
    update! { collection_path }
  end

  protected

  def begin_of_association_chain
    current_user
  end

  private

  def permitted_params
    params.permit(device: %i[name])
  end
end
