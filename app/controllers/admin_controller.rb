class AdminController < AuthenticatedController
  before_action :ensure_user_is_admin

  private

  def ensure_user_is_admin
    redirect_back fallback_location: root_path unless current_user.is_admin?
  end
end
