class Admin::AboutController < Admin::AuthorizedController
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