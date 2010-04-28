class Admin::MenuCategoriesController < Admin::AuthorizedController
  restful_controller :redirect_to => :admin_menu_categories_path
end