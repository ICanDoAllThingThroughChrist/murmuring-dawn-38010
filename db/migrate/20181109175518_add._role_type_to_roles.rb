class Add < ActiveRecord::Migration[5.1]
  def change
    add_column :roles, :role_type, :integer 
  end
end
