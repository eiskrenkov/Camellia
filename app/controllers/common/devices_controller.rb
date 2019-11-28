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

  def device_params
    params.require(:device).permit(:name, :internal_name, :schedule_id, :user_id)
  end
end
