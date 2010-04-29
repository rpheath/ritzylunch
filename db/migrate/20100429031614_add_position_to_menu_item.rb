class AddPositionToMenuItem < ActiveRecord::Migration
  def self.up
    add_column :menu_items, :position, :integer, :default => 0
  end

  def self.down
    remove_column :menu_items, :position
  end
end
