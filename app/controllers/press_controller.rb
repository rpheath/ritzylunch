class PressController < ApplicationController
  caches_page :index
  
  def index
    render
  end
end