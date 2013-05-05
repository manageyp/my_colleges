class AddAddressToSchools < ActiveRecord::Migration
  def change
    add_column  :schools, :address, :string
    add_column  :schools, :telephone, :string
    add_column  :schools, :sina_code, :string
  end
end
