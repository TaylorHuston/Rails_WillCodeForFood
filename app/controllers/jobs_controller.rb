class JobsController < ApplicationController

  before_action :confirm_access, :only => [:edit, :update]

  def index
    @jobs = Job.order("created_at DESC").page(params[:page]).per(10)
  end

  def new
    @job = Job.new
  end
  
  def create
      @job = Job.new(job_params)

      if verify_recaptcha(:model => @job, :message => "Are you human?")
        @job.user_id = session[:user_id]
        if @job.save
          redirect_to root_path
        else
          render 'new'
        end
      else
        render 'new'
      end
  end
  
  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])

    if @job.update_attributes(job_params)
      flash[:notice] = "Update Successful"
      redirect_to(:controller => "users", :action => "posts", :id => @job.user_id)
    else
      render 'edit'
    end
  end


  private
    def job_params
      params.require(:job).permit(:title, :company, :url, :category, :description, :location, :user_id)
    end

    def confirm_access
      @job = Job.find(params[:id])
      #debugger

      if session[:user_id] == nil
        flash[:notice] = "Please log in"
        redirect_to(:controller => "access", :action => "login")
        return false
      end

      if User.find(session[:user_id]).admin == true
        return true
      end

      if @job.user_id.to_i == session[:user_id]
        return true
      end

      flash[:notice] = "You do not have access to do that"
      redirect_to(root_path)

      return false

    end
  
end
