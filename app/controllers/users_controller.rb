class UsersController < ApplicationController
  
  before_action :confirm_access, :except => [:new, :create]
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
  
  def posts
    @jobs = Job.where(:user_id => params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if verify_recaptcha(:model => @user, :message => "Are you human?")
      if @user.save
        flash[:notice] = "Registration Successful"
        redirect_to(:controller => "access", :action => "login")
      else
        render 'new'
      end
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    
    if @user.update_attributes(user_params)
      flash[:notice] = "Update Successful"
      redirect_to(:controller => "users", :action => "show", :id => @user.id)
    else
      render 'edit'
    end
    
  end

  def delete
    @user = User.find(params[:id])
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    
    flash[:notice] = "#{user.name} Deleted"
    redirect_to(:controller => "users", :action => "index")
  end
  
  private 
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
  
    def confirm_access
      #debugger

      if session[:user_id] == nil
        flash[:notice] = "Please log in"
        redirect_to(:controller => "access", :action => "login")
        return false
      end

      if User.find(session[:user_id]).admin == true
        return true
      end

      if params[:id].to_i == session[:user_id]
        return true
      end

      flash[:notice] = "You do not have access to do that"
      redirect_to(root_path)

      return false

    end
  
end
