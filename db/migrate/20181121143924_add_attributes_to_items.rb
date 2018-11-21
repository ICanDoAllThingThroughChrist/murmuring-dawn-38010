class AddAttributesToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :frequency, :integer
    add_column :items, :task, :integer
    add_column :items, :site, :integer
  end
end
