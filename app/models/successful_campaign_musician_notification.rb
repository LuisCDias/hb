class SuccessfulCampaignMusicianNotification
  def initialize(campaign)
    @campaign = campaign
    @musician = campaign.musician
  end

  def deliver
    send_notification_to_musician
  end

  private

  attr_reader :campaign, :musician

  def send_notification_to_musician
    UserMailer.delay.
      successful_campaign_notification_for_musician(campaign, musician)
  end
end
