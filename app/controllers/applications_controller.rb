class ApplicationsController < ApplicationController

  before_action :authenticate_user!

  before_action :confirm_current_user, only: [:new, :create]

  def new 
    @job = Job.find(params[:id])
    @application = @job.applications.new
  
  end


  def create 
    @job = Job.find(params[:id])
    @application = @job.applications.new(params_application)
    @application.user = current_user

    if @application.save 
      redirect_to @job
    else
      render :new 
    end
  end


  private


  def confirm_current_user 
    if current_user.candidate? == false 
      redirect_to root_path
  end

  def params_application
    params.require(:application).permit(:resume, :cover_letter)
  end
end
