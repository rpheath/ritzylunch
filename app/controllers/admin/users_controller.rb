class Admin::UsersController < Admin::AuthorizedController
  restful_controller :redirect_to => :admin_users_path
end