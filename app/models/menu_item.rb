class MenuItem < ActiveRecord::Base
  belongs_to :menu_category
  
  validates_presence_of :menu_category_id, :name, :price
end