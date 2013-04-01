class CreateDomestics < ActiveRecord::Migration
  def change
    create_table :domestics do |t|
      t.string :college_type
      t.string :is_211
      t.string :is_985
      t.string :affiliate
      t.string :is_edu_affiliate
      t.string :has_bachelor
      t.string :is_independent
      t.string :is_civilian_run
      t.integer :key_disciplines
      t.integer :master_num
      t.integer :phd_num
      t.integer :academician_num

      t.timestamps
    end

    add_index :domestics, :college_type
    add_index :domestics, :is_211
    add_index :domestics, :is_985
    add_index :domestics, :affiliate
    add_index :domestics, :is_edu_affiliate
    add_index :domestics, :has_bachelor
    add_index :domestics, :is_civilian_run
  end
end
