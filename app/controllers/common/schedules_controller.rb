class Common::SchedulesController < AuthenticatedController
  defaults resource_class: Schedule

  navigation_section :schedules

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

  def schedule_params
    params.require(:schedule).permit(
      :name, scheduled_media_attributes: %i[id times_per_hour media_id schedule_id _destroy]
    )
  end
end
