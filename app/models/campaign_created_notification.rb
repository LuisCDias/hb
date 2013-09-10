class CampaignCreatedNotification
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
    UserMailer.delay.campaign_created(campaign, musician)
  end
end
