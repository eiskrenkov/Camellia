class LinkDevicesWithUser < ActiveRecord::Migration[6.0]
  def change
    add_reference :devices, :user
  end
end
