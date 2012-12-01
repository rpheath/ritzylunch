class ApplicationController < ActionController::Base
  helper :all
  helper_method :current_user
  helper_method :logged_in?
  
  protect_from_forgery

  filter_parameter_logging :password
  
  before_filter :ensure_domain
  
  PRIMARY_HOSTNAME = 'ritzylunchwv.com'
  
protected
  def ensure_domain
    if Rails.env.production? && request.env['HTTP_HOST'] != PRIMARY_HOSTNAME
      redirect_to URI.join("http://#{PRIMARY_HOSTNAME}", request.env['PATH_INFO'] || '/').to_s
    end
  end
  
  def logged_in?
    !!current_user
  end

  def current_user
    @current_user ||= login_from_session unless @current_user == false
  end

  def current_user=(new_user)
    session[:user_id] = new_user ? new_user.id : nil
    @current_user = new_user || false
  end
  
  def login_from_session
    self.current_user = User.find_by_id(session[:user_id]) if session[:user_id]
  end
  
  def login_required
    return true if logged_in?

    error "Sorry, you must be logged in to access that area"
    redirect_to new_session_path 
  end
end
