class AddDateToAnnouncements < ActiveRecord::Migration
  def self.up
    add_column :announcements, :date, :datetime
  end

  def self.down
    remove_column :announcements, :date
  end
end
