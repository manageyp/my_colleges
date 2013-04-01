class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.integer :province_id, null: false
      t.string :nick_name
      t.string :real_name

      t.timestamps
    end

    add_index :cities, :province_id
    add_index :cities, :nick_name
    add_index :cities, :real_name
  end
end
