class Admin::AnnouncementsController < Admin::AuthorizedController
  restful_controller :redirect_to => :admin_announcements_path
  
  after_filter :clear_cache, :only => [:create, :update, :destroy]
  
protected
  def clear_cache
    FileUtils.rm(File.join(Rails.public_path, 'announcements.html')) rescue nil
  end
end