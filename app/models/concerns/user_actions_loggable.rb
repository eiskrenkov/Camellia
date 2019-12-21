module UserActionsLoggable
  extend ActiveSupport::Concern

  SYSTEM_AUTHOR = 'SYSTEM'.freeze
  RESTRICTED_DESTROY_ACTION_FIELDS = %w[id].freeze

  included do
    before_save :remember_action_changes
    after_save :persist_user_action

    before_destroy :remember_destroy_action_changes, prepend: true
    after_destroy :persist_user_action
  end

  def persist_user_action
    return if @change_set.blank?

    UserAction.create!(
      changed_object_type: self.class.name,
      changed_object_id: id,
      change_type: detect_action_type,
      change_set: @change_set,
      author: User.current.present? ? User.current.email : SYSTEM_AUTHOR
    )
  end

  def remember_destroy_action_changes
    remember_action_changes(
      change_set: attributes.except(*RESTRICTED_DESTROY_ACTION_FIELDS)
    )
  end

  private

  def remember_action_changes(change_set: nil)
    @change_set = change_set || changes
  end

  def detect_action_type
    if !persisted?
      UserActionType::DELETE
    elsif saved_change_to_id?
      UserActionType::CREATE
    else
      UserActionType::UPDATE
    end
  end
end
