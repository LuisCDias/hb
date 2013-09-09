class UserMailer < ActionMailer::Base
  default from: "tiago@headblendr.com"

  def signup_confirmation(user)
    @user = user
    mail(to: @user.email, subject: "Headblendr Loves You")
  end

  def campaign_created(musician, campaign_name)
    @musician = musician
    @campaign = campaign
    mail(to: @musician.email, subject: "#{@musician.name} up, up, up!")
  end

  def campaign_successful_fan(backer, campaign)
    @campaign_name = campaign.name
    @campaign_track_permalink = campaign.track_permalink

    mail(to: backer, subject: "#{@campaign_name} is now available for download")
  end

  def campaign_successful_musician(musician_email, campaign_name)
    @campaign_name = campaign_name
    mail(to: musician_email, subject: "#{@campaign_name} is launched")
  end

  def campaign_deleted(musician_email, campaign)
  end
end
