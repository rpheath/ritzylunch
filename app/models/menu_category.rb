class MenuCategory < ActiveRecord::Base
  has_many :menu_items, :order => "menu_items.position"
  
  validates_presence_of :name
  
  acts_as_lookup :name, :default_text => '-- Choose Category --'
  
  named_scope :positioned, :order => "position, name"
end