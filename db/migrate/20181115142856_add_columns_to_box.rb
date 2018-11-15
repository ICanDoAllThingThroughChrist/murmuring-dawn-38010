class AddColumnsToBox < ActiveRecord::Migration[5.1]
  def change
    add_column :boxes, :task, :string
    add_column :boxes, :site, :string
  end
end
