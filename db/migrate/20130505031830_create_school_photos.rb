class CreateSchoolPhotos < ActiveRecord::Migration
  def change
    create_table :school_photos do |t|
      t.integer :school_id
      t.string :photo_url
      t.boolean :is_avatar, default: false
      t.string :status

      t.timestamps
    end

    add_index :school_photos, :school_id
  end
end
