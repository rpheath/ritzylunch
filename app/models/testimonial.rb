class Testimonial < ActiveRecord::Base
  include Ritzy::Pagination
  include Textilizer
  
  validates_presence_of :name, :body
  
  textilize :body
end