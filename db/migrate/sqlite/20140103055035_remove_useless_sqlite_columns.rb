class RemoveUselessSqliteColumns < ActiveRecord::Migration
  def up
    remove_column :majors, :eol_url
    remove_column :school_introductions, :short_content
    remove_column :school_photos, :status
  end

  def down
  end
end
