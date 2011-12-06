class SessionsController < ApplicationController
  
  def new

  end


  def create
    user = login(params[:email], params[:password], params[:remember_me])
    if user
      redirect_back_or_to user_path(current_user), :notice => "Logged in!"
    else
      flash.now.alert = "Email or password was invalid."
    end
  end
  
  
  def destroy
    logout
    redirect_to login_path, :notice => "Logged out!"
  end

end
