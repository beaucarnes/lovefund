require 'test_helper'

class SubscriptionMailerTest < ActionMailer::TestCase
  test "notification_message" do
    mail = SubscriptionMailer.notification_message
    assert_equal "Notification message", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
