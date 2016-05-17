class Notification < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification.mark_as_complete.subject
  #
  def mark_as_complete
    @task = task
    mail to: "#{@task.project.client.email}",subject: "Task Completed - #{@task.name}"
  end
end
