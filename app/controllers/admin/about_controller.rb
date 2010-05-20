class Admin::AboutController < Admin::AuthorizedController
  after_filter :clear_cache, :only => [:update]
  
protected
  def clear_cache
    FileUtils.rm(File.join(Rails.public_path, 'about.html')) rescue nil
  end

public
  def edit
    @about = About.only
  end
  
  def update
    @about = About.only
    @about.update_attributes!(params[:about])
    notice "Successfully updated About content"
    redirect_to admin_base_index_path
    
  rescue ActiveRecord::RecordInvalid => e
    error_now e.message
    render :edit
  end
end