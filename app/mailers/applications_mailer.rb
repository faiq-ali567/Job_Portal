class ApplicationsMailer < ApplicationMailer
  default from: 'no-reply@example.com'
  layout 'mailer'

  def new_application
    @application = params[:application]
    @job = Job.find(@application.job_id)
    @user = @application.user

    mail(to: @job.company.email, subject: "New application for #{@job.title}")
  end
end
