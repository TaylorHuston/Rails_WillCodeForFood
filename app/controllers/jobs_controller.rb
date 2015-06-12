class JobsController < ApplicationController
  def index
    @jobs = Job.page(params[:page]).per(10)
  end

  def new
    @job = Job.new
  end
  
  def create
    if verify_recaptcha(:model => @job, :message => "Are you human?")
      @job = Job.new(params.require(:job).permit(:title, :company, :url, :category, :description))

      if @job.save
        redirect_to root_path
      else
        render 'new'
      end
    else
      render 'new'
    end
  end
  
end
