class CreateProvinces < ActiveRecord::Migration
  def change
    create_table :provinces do |t|
      t.integer :country_id, null: false
      t.string :nick_name
      t.string :real_name

      t.timestamps
    end

    add_index :provinces, :country_id
    add_index :provinces, :nick_name
    add_index :provinces, :real_name
  end
end
