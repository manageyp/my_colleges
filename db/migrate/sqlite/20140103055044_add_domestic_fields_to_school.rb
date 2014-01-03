class AddDomesticFieldsToSchool < ActiveRecord::Migration
  def change
    add_column :schools, :college_type, :string
    add_column :schools, :is_211, :string
    add_column :schools, :is_985, :string
    add_column :schools, :affiliate, :string
    add_column :schools, :is_edu_affiliate, :string
    add_column :schools, :has_bachelor, :string
    add_column :schools, :is_independent, :string
    add_column :schools, :is_civilian_run, :string

    add_column :schools, :key_disciplines, :integer
    add_column :schools, :master_num, :integer
    add_column :schools, :phd_num, :integer
    add_column :schools, :academician_num, :integer

    remove_index :schools, column: [:detail_type, :detail_id]
  end
end
