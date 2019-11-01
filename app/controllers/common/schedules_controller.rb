class Common::SchedulesController < AuthenticatedController
  defaults resource_class: Schedule

  navigation_section :schedules

  def create
    create! { collection_path }
  end

  def update
    resource.update(permitted_params)
    redirect_to collection_path
  end

  protected

  def begin_of_association_chain
    current_user
  end

  private

  def permitted_params
    params.require(:schedule).permit(
      :name, scheduled_media_attributes: %i[id times_per_hour media_id schedule_id]
    )
  end
end
