class CreateScoreLines < ActiveRecord::Migration
  def change
    create_table :score_lines do |t|
      t.string :name
      t.integer :province_id
      t.integer :syear
      t.integer :smajor
      t.integer :batch
      t.integer :score

      t.timestamps
    end

    add_index :score_lines, :name
    add_index :score_lines, :province_id
    add_index :score_lines, :syear
  end
end