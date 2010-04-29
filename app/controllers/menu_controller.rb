class MenuController < ApplicationController
  def index
    @menu_categories = MenuCategory.positioned
  end
end