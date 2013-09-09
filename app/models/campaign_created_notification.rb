class CampaignCreatedNotification
  attr_reader :campaign, :musician

  def initialize(campaign)
    @campaign = campaign
    @musician = campaign.musician
  end

  def deliver
    send_notification_to musician
  end

  private

  def send_notification_to(musician)
    UserMailer.campaign_created(musician, campaign).deliver
  end
end
