require 'test_helper'

class PostMailerTest < ActionMailer::TestCase
  test "post_activation" do
    mail = PostMailer.post_activation
    assert_equal "Post activation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
