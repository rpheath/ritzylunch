class MenuCategory < ActiveRecord::Base
  has_many :menu_items
  
  validates_presence_of :name
  
  acts_as_lookup :name, :default_text => '-- Choose Category --'
end