class SignupNotification
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def deliver
    send_notification_to user
  end

  private

  def send_notification_to(user)
    UserMailer.delay.signup_confirmation(user)
  end
end
