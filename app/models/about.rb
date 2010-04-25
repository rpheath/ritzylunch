class About < ActiveRecord::Base
  include Textilizer
  
  textilize :content
  
  def self.only
    existing_content = self.first
    return existing_content unless existing_content.blank?
    
    content = self.new
    content.save(false)
    content
  end
end