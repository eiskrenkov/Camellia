# == Schema Information
#
# Table name: user_actions
#
#  id                  :bigint           not null, primary key
#  author              :string(255)      default("N/A"), not null
#  change_type         :string(255)      not null
#  changed_object_type :string(255)
#  changed_object_id   :integer
#  change_set          :text(65535)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class UserAction < ApplicationRecord
  extend EnumerateIt

  belongs_to :changed_object, polymorphic: true, optional: true

  scope :ordered, -> { order('created_at desc') }
  scope :filtered, ->(filter) { select { |item| item.changed_object_type == filter } }

  serialize :change_set, JSON
  has_enumeration_for :change_type, with: ::UserActionType, required: true

  def changed_object_is_not_available?
    changed_object.nil? || change_type == UserActionType::DELETE
  end

  def human_changed_object_type
    changed_object_type.constantize.model_name.human
  end
end
