class Admin::MenuCategoriesController < Admin::AuthorizedController
  restful_controller :redirect_to => :admin_menu_categories_path

  after_filter :clear_cache, :only => [:create, :update, :destroy, :reorder]
  
protected
  def clear_cache
    FileUtils.rm(File.join(Rails.public_path, 'menu.html')) rescue nil
  end

public  
  def index
    @menu_categories = MenuCategory.positioned
  end
  
  def sortable
    @menu_categories = MenuCategory.positioned
  end
  
  def reorder
    category_ids = params[:item_ids].first.split(',')
    
    category_ids.each_with_index do |id, index|
      category = MenuCategory.find(id)
      category.update_attribute(:position, index) if category
    end unless params[:item_ids].blank?
    
    notice "Successfully reordered your menu categories"
    redirect_to admin_menu_categories_path
  end
end