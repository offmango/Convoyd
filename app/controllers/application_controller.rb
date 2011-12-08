class ApplicationController < ActionController::Base
  
  protect_from_forgery
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to login_path, :alert => exception.message
  end
  
  
  private
    
  def not_authenticated
    redirect_to login_url, :alert => "First log in to view this page."
  end
  
  
  
end
