class Testimonial < ActiveRecord::Base
  include Textilizer
  
  validates_presence_of :from, :body
  
  textilize :body
end