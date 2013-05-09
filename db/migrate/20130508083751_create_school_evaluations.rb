class CreateSchoolEvaluations < ActiveRecord::Migration
  def change
    create_table :school_evaluations do |t|
      t.integer :school_id, null: false
      t.integer :follow_count, default: 0

      t.timestamps
    end

    add_index :school_evaluations, :school_id
  end
end
