class CreateMenuItems < ActiveRecord::Migration
  def self.up
    create_table :menu_items do |t|
      t.integer :menu_category_id
      t.string :name
      t.string :price

      t.timestamps
    end
  end

  def self.down
    drop_table :menu_items
  end
end
