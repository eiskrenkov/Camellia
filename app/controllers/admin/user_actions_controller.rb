class Admin::UserActionsController < AdminController
  defaults resource_class: UserAction

  def export
    send_data(collection.to_json, filename: "user_actions_#{Time.now.to_i}.json", type: 'application/json')
  end

  def collection
    super.ordered.filtered(params[:filter]).presence || super
  end
end
