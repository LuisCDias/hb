class UserMailer < ActionMailer::Base
  default from: "tiago@headblendr.com"

  def signup_confirmation(user)
    @greeting = "Hi"
    mail to: user.email, subject: "Headblendr Loves You"
  end

  def campaign_created(user)
    mail to: user.email, subject: user.name + "up, up, up!"
  end

  def campaign_successful_fan(user)
    mail to: user.email, subject: "campaign name is now available for download"
  end

  def campaign_succesful_musician(user)
    mail to: user.email, subject: "campaign name is launched"
  end
end
