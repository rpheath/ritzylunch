class CreateAnnouncements < ActiveRecord::Migration
  def self.up
    create_table :announcements do |t|
      t.integer :user_id
      t.string :title
      t.text :body
      t.text :body_html

      t.timestamps
    end
  end

  def self.down
    drop_table :announcements
  end
end
