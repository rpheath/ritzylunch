class Announcement < ActiveRecord::Base
  include Textilizer
  
  belongs_to :user
  
  validates_presence_of :user_id, :title, :body
  
  textilize :body
end