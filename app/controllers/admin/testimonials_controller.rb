class Admin::TestimonialsController < Admin::AuthorizedController
  restful_controller :redirect_to => :admin_testimonials_path
  
  after_filter :clear_cache, :only => [:create, :update, :destroy]
  
protected
  def clear_cache
    FileUtils.rm(File.join(Rails.public_path, 'testimonials.html')) rescue nil
  end
end