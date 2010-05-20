class Admin::MenuItemsController < Admin::AuthorizedController
  restful_controller :redirect_to => :admin_menu_items_path

  after_filter :clear_cache, :only => [:create, :update, :destroy, :reorder]
  
protected
  def clear_cache
    FileUtils.rm(File.join(Rails.public_path, 'menu.html')) rescue nil
  end

public  
  def sortable
    @menu_items = MenuItem.find_all_by_menu_category_id(params[:category])
  end
  
  def reorder
    item_ids = params[:item_ids].first.split(',')
    
    item_ids.each_with_index do |id, index|
      item = MenuItem.find(id)
      item.update_attribute(:position, index) if item
    end unless params[:item_ids].blank?
    
    notice "Successfully reordered your menu categories"
    redirect_to admin_menu_categories_path
  end
end