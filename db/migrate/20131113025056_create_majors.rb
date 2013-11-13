class CreateMajors < ActiveRecord::Migration
  def change
    create_table :majors do |t|
      t.string :name
      t.integer :parent_id
      t.string :code
      t.string :college_type

      t.timestamps
    end

    add_index :majors, :name
    add_index :majors, :parent_id
    add_index :majors, :college_type
  end
end
