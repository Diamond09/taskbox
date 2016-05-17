require 'test_helper'

class NotificationTest < ActionMailer::TestCase
  test "mark_as_complete" do
    mail = Notification.mark_as_complete
    assert_equal "Mark as complete", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
