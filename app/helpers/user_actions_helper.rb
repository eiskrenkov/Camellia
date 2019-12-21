module UserActionsHelper
  USER_ACTIONS_BADGES_CLASSES_MAPPING = {
    UserActionType::CREATE => 'badge-success',
    UserActionType::UPDATE => 'badge-warning',
    UserActionType::DELETE => 'badge-danger'
  }.freeze

  def user_action_change_type_badge_for(user_action)
    badge_class = USER_ACTIONS_BADGES_CLASSES_MAPPING[user_action.change_type]

    content_tag(:span, user_action.change_type.upcase, class: "badge #{badge_class}")
  end

  def user_actions_filters
    filters = UserAction.all.pluck(:changed_object_type).map do |filter|
      param_filter = filter.underscore

      {
        text: filter.constantize.model_name.human(count: ''),
        href: admin_history_items_path(filter: param_filter),
        class: ('active' if params[:filter] == param_filter)
      }
    end << { text: 'Все', href: admin_history_items_path, class: ('active' unless params[:filter]) }

    buttons(filters.reverse)
  end
end
