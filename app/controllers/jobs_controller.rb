class JobsController < ApplicationController

  before_action :authenticate_user!
  before_action :confirm_current_user, only: [:new, :edit, :create, :update, :destroy]

  def index 
    
    @jobs = Job.all
  
  end


  def edit 
    @job = Job.find(params[:id])
  end


  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to @job
    else
      render :edit
    end
  end

  def new
    @job = current_user.jobs.new 

  end

  def create
    @job = current_user.jobs.new(job_params)
    if @job.save 
      redirect_to @job
    else
      render :new
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to jobs_path
  end

  def show
    @job = Job.find(params[:id])
  end



  private 


  def confirm_current_user
    if current_user.company? == false
      redirect_to jobs_path
    end
  end

  def job_params
    params.require(:job).permit(:title, :description, :location, :salary, documents: [])

  end

end 
