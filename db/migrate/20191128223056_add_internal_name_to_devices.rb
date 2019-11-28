class AddInternalNameToDevices < ActiveRecord::Migration[6.0]
  def change
    add_column :devices, :internal_name, :string, null: false, default: ''
  end
end
