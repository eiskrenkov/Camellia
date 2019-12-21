class AddPresentCountToMedia < ActiveRecord::Migration[6.0]
  def change
    add_column :media, :present_count, :integer, null: false, default: 0
  end
end
