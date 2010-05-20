class AboutController < ApplicationController
  caches_page :index
  
  def index
    @about = About.only
  end
end