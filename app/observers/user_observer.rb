class UserObserver < ActiveRecord::Observer
  observe :user

  def after_create(user)
    send_signup_confirmation_to user
  end

  private

  def send_signup_confirmation_to(user)
    SignupNotification.new(user).deliver
  end
end
