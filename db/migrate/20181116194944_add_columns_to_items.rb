class AddColumnsToItems < ActiveRecord::Migration[5.1]
  def change
    add_column  :items, :site_id, :integer
    add_column  :items, :task_id, :integer
  end
end
