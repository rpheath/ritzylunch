class Admin::AnnouncementsController < Admin::AuthorizedController
  restful_controller :redirect_to => :admin_announcements_path
end