class MenuController < ApplicationController
  caches_page :index
  
  def index
    @menu_categories = MenuCategory.positioned
  end
end