class SuccessfulCampaignMusicianNotification
  def initialize(campaign)
    @campaign = campaign
  end

  def deliver
    send_notification_to musician_email
  end

  private

  attr_reader :campaign

  def campaign_name
    campaign.name
  end

  def musician_email
    campaign.musician.email
  end

  def send_notification_to(musician_email)
    UserMailer.delay.campaign_successful_musician(musician_email, campaign_name)
  end
end
