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

  def send_notification_to(musician_email)
    UserMailer.delay.campaign_successful_musician(
      musician_email,
      campaign
    ).deliver
  end
end
