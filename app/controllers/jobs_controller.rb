class JobsController < ApplicationController
  load_and_authorize_resource

  def index 
    @pagy, @jobs = pagy(Job.order(:created_at))
  end


  def edit 
  end


  def update
    if @job.update(job_params)
      redirect_to @job
    else
      render :edit
    end
  end

  def new
  end

  def create
    @job.company = current_user
    if @job.save 
      redirect_to @job
    else
      render :new
    end
  end

  def destroy

    @job.destroy
    redirect_to jobs_path
  end

  def show
  end



  private 


  def job_params
    params.require(:job).permit(:title, :description, :location, :salary, documents: [])

  end

end 
