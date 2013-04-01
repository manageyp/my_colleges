class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      #t.string :code, null: false
      t.string :detail_type, null: false
      t.integer :detail_id, null:false

      t.integer :country_id, default: nil
      t.integer :province_id, default: nil
      t.integer :city_id, default: nil

      t.string :nick_name
      t.string :real_name
      t.string :web_site
      t.string :found_year

      t.string :ifeng_code

      t.timestamps
    end

    #add_index :schools, :code, :unique => true
    add_index :schools, [:detail_type, :detail_id], :unique => true
    add_index :schools, :nick_name
    add_index :schools, :real_name
    add_index :schools, :country_id
    add_index :schools, :province_id
    add_index :schools, :city_id
  end
end
