class AddZipcodeToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :latitude, :string
    add_column :schools, :longitude, :string
    add_column :schools, :zipcode, :string
  end
end
