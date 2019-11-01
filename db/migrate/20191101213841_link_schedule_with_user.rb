class LinkScheduleWithUser < ActiveRecord::Migration[6.0]
  def change
    add_reference :schedules, :user
  end
end
