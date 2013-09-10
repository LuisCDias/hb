class SignupNotification
  def initialize(user)
    @user = user
  end

  def deliver
    send_notification_to_user
  end

  private

  attr_reader :user

  def send_notification_to_user
    UserMailer.delay.signup_confirmation(user)
  end
end
