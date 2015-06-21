class AccessController < ApplicationController
  def index
  end

  def login
  end
  
  def attempt_login
    if params[:email].present? && params[:password].present?
      found_user = User.where(:email => params[:email]).first
      
      if found_user
        auth_user = found_user.authenticate(params[:password])
      end
    end
    
    if auth_user
      session[:user_id] = auth_user.id
      session[:email] = auth_user.email
      flash[:notice] = "Log-in Successfull"
      redirect_to(:controller => "users", :action => "show", :id => auth_user.id)
    else
      flash[:notice] = "Invalid username/password combination."
      redirect_to(:action => "login")
    end
  end
  
  def logout      
    session[:user_id] = nil
    session[:email] = nil
    flash[:notice] = "Logged Out"
    redirect_to(:action => "login")
  end
  
end
