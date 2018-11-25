class AddAttributesToBoxes < ActiveRecord::Migration[5.1]
  def change
    add_column :boxes, :frequency, :integer
    remove_column :boxes, :site
    remove_column :boxes, :task
    add_column :boxes, :site, :integer
    add_column :boxes, :task, :integer
  end
end
