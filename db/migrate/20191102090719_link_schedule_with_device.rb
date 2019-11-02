class LinkScheduleWithDevice < ActiveRecord::Migration[6.0]
  def change
    add_reference :devices, :schedule
  end
end
