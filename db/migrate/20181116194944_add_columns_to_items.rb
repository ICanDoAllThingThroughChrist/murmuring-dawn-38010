class AddColumnsToItems < ActiveRecord::Migration[5.1]
  def change
    add_reference :items, :site, foreign_key: true 
    add_reference :items, :task, foreign_key: true
  end
end
