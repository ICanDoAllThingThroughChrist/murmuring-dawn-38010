class AddFrequencyidToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :frequency_id, :integer
  end
end
