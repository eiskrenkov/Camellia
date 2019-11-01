class CreateScheduledMedia < ActiveRecord::Migration[6.0]
  def change
    create_table :scheduled_media do |t|
      t.integer :times_per_hour, null: false, default: 1

      t.references :media
      t.references :schedule

      t.timestamps
    end
  end
end
