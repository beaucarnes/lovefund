require 'test_helper'

class ClaimMailerTest < ActionMailer::TestCase
  test "claim_notification" do
    mail = ClaimMailer.claim_notification
    assert_equal "Claim notification", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
