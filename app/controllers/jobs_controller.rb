class JobsController < ApplicationController
  def index
    @jobs = Job.order("created_at DESC").page(params[:page]).per(10)
  end

  def new
    @job = Job.new
  end
  
  def create
      @job = Job.new(job_params)

      if verify_recaptcha(:model => @job, :message => "Are you human?")
        if @job.save
          redirect_to root_path
        else
          render 'new'
        end
      else
        render 'new'
      end
  end
  
  private
  def job_params
    params.require(:job).permit(:title, :company, :url, :category, :description, :location)
  end
  
end
