class PressController < ApplicationController
  caches_page :index
  
  def index
    @links = Link.all
  end
end