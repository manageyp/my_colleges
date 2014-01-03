class RemoveUselessSchoolColumns < ActiveRecord::Migration
  def up
    remove_column :schools, :ifeng_code
    remove_column :schools, :sina_code
    remove_column :schools, :detail_type
    remove_column :schools, :detail_id

    add_index :schools, :college_type
    add_index :schools, :is_211
    add_index :schools, :is_985
    add_index :schools, :affiliate
    add_index :schools, :is_edu_affiliate
    add_index :schools, :has_bachelor
    add_index :schools, :is_civilian_run
  end

  def down
  end
end
