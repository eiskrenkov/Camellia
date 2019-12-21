class CreateUserActions < ActiveRecord::Migration[6.0]
  def change
    create_table :user_actions do |t|
      t.string :author, null: false, default: 'N/A'
      t.string :change_type, null: false
      t.string :changed_object_type
      t.integer :changed_object_id

      t.text :change_set

      t.timestamps null: false
    end
  end
end
