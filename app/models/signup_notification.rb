class SignupNotification
  def initialize(user)
    @user = user
  end

  def deliver
    send_notification_to user_email
  end

  private

  attr_reader :user

  def user_email
    user.email
  end

  def send_notification_to(user_email)
    UserMailer.delay.signup_confirmation(user_email).deliver
  end
end
