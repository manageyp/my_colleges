class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name, null: false
      t.string :email
      t.string :email_status
      t.string :cellphone
      t.string :cellphone_status
      t.date :register_date
      t.string :status

      t.timestamps
    end

    add_index :users, :user_name, unique: true
    add_index :users, :email
    add_index :users, :cellphone
    add_index :users, :register_date
  end
end
