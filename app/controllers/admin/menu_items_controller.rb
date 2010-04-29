class Admin::MenuItemsController < Admin::AuthorizedController
  restful_controller :redirect_to => :admin_menu_items_path
  
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