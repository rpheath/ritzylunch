class CreateAbouts < ActiveRecord::Migration
  def self.up
    create_table :abouts do |t|
      t.string :page_title
      t.text :content
      t.text :content_html
      t.timestamps
    end
  end

  def self.down
    drop_table :abouts
  end
end
