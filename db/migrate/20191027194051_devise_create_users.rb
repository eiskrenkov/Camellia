class DeviseCreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email, null: false, default: ''
      t.string :encrypted_password, null: false, default: ''

      t.boolean :admin, null: false, default: false

      t.timestamps
    end

    change_table :users, bulk: true do |t|
      t.index :email, unique: true
    end
  end
end
