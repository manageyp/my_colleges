class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.integer :user_id, default: nil
      t.string :mac, null: false
      t.string :status

      t.timestamps
    end

    add_index :devices, :user_id
    add_index :devices, :mac
  end
end
