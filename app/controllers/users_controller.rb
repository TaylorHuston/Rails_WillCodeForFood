class UsersController < ApplicationController
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
        redirect_to(:controller => "users", :action => "show", :id => @user.id)
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
    
    redirect_to(:controller => "users", :action => "index")
  end
  
  private 
    def user_params
      params.require(:user).permit(:name, :email)
    end
  
end
