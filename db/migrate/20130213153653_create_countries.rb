class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :nick_name
      t.string :real_name

      t.timestamps
    end

    add_index :countries, :nick_name
    add_index :countries, :real_name
  end
end
