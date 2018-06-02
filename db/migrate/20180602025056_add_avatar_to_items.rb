class AddAvatarToItems < ActiveRecord::Migration[5.1]
  def self.up
    add_attachment :items, :avatar
  end

  def self.down 
    remove_attachment :items, :avatar
  end
end
