class UserMailer < ActionMailer::Base
  default from: "tiago@headblendr.com"

  def signup_confirmation(user)
    @user = user
    mail(to: @user.email, subject: "Headblendr Loves You")
  end

  def campaign_created(campaign, musician)
    @campaign = campaign
    @musician = musician
    mail(to: @musician.email, subject: "#{@musician.name} up, up, up!")
  end

  def successful_campaign_notification_for_backer(backer, campaign)
    @backer = backer
    @campaign = campaign
    mail(to: @backer.email, subject: "#{@campaign.name} is now available for download")
  end

  def successful_campaign_notification_for_musician(campaign, musician)
    @campaign = campaign
    @musician = musician
    mail(to: @musician.email, subject: "#{@campaign.name} is launched")
  end
end
