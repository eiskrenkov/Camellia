class UseEnabledAsDefaultDeviceStatus < ActiveRecord::Migration[6.0]
  def change
    change_column :devices, :status, :string, default: 'enabled'
  end
end
