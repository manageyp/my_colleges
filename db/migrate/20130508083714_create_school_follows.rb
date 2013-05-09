class CreateSchoolFollows < ActiveRecord::Migration
  def change
    create_table :school_follows do |t|
      t.integer :school_id, null: false
      t.integer :device_id, null: false
      t.date :the_date
      t.string :status

      t.timestamps
    end

    add_index :school_follows, :school_id
    add_index :school_follows, :device_id
    add_index :school_follows, :the_date
  end
end
