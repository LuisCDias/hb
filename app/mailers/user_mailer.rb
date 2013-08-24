class UserMailer < ActionMailer::Base
  default from: "tiago@headblendr.com"

  def signup_confirmation(user)
    @user = user
    @greeting = "Hi"

    mail(to: @user.email, subject: "Headblendr Loves You")
  end

  def campaign_created(user, campaign)
    @user = user
    @campaign = campaign
    mail(to: @user.email, subject: @user.name + " up, up, up!")
  end

  def campaign_successful_fan(backer, campaign)
    @campaign = campaign
    mail(to: backer, subject: @campaign.name + " is now available for download")
  end

  def campaign_successful_musician(musician_email, campaign)
    @campaign = campaign
    mail(to: musician_email, subject: @campaign.name + " is launched")
  end
end
