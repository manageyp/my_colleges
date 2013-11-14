class CreateMajorIntroductions < ActiveRecord::Migration
  def change
    create_table :major_introductions do |t|
      t.integer :major_id
      t.string :content

      t.timestamps
    end
  end
end
