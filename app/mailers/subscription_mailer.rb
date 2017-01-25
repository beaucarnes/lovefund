class SubscriptionMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.subscription_mailer.notification_message.subject
  #
  def notification_message(subscription, post)
    @subscription = subscription
    @post = post
    mail to: subscription.email, subject: "A new post on Lovefund matches your criteria!"
  end
end
