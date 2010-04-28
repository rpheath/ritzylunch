class Admin::MenuItemsController < Admin::AuthorizedController
  restful_controller :redirect_to => :admin_menu_items_path
end