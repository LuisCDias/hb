class SuccessfulCampaignMusicianNotification
  def initialize(campaign)
    @campaign = campaign
  end

  def deliver
    send_notification_to musician_email
  end

  private

  attr_reader :campaign

  def musician_email
    campaign.musician.user.email
  end

  def campaign_name
    campaign.name
  end

  def send_notification_to(musician_email)
    UserMailer.campaign_successful_musician(
      musician_email,
      campaign_name
    ).deliver
  end
end
