class Admin::LinksController < Admin::AuthorizedController
  restful_controller :redirect_to => :admin_links_path

  after_filter :clear_cache, :only => [:create, :update, :destroy]
  
protected
  def clear_cache
    FileUtils.rm(File.join(Rails.public_path, 'press.html')) rescue nil
  end
end