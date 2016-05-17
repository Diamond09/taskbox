# Preview all emails at http://localhost:3000/rails/mailers/notification
class NotificationPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/notification/mark_as_complete
  def mark_as_complete
    Notification.mark_as_complete
  end

end
