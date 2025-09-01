class ApplicationsController < ApplicationController

  load_and_authorize_resource :job
  load_and_authorize_resource :application, through: :job


  def new 
  end


  def create 
    @application.user = current_user
    if @application.save 
      ApplicationsMailer.with(application: @application).new_application.deliver_later
      # p "------------------------------------------------------------------------"
      # p "------------------------------------------------------------------------"
      # p @application
      # p "------------------------------------------------------------------------"
      # p "------------------------------------------------------------------------"
      redirect_to @job
    else
      render :new 
    end
  end


  private



  def application_params
    params.require(:application).permit(:resume, :cover_letter)
  end
end
