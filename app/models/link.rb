class Link < ActiveRecord::Base
  validates_presence_of :link_text, :link_url
end
