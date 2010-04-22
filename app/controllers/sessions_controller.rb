class SessionsController < ApplicationController
  def new
    respond_to do |format|
      format.js { render :partial => 'login.html.erb' }
      format.html
    end
  end
  
  def create
		user = User.new(params[:user]).try_to_login!
		self.current_user = user
		redirect_to(admin_base_index_path)
		
  rescue Exception => e
    error e.message
    redirect_to new_session_path
  end

  def destroy
  	self.current_user = nil
  	notice "You've been logged out successfully"
  	redirect_to root_path
  end
end