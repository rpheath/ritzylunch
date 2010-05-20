class HomeController < ApplicationController
  caches_page :index
  
  def index
    render
  end
end