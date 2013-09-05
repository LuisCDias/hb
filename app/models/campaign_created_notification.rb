class CampaignCreatedNotification
  def initialize(campaign)
    @campaign = campaign
  end

  def deliver
    send_notification_to musician
  end

  private

  attr_reader :campaign

  def campaign_name
    campaign.name
  end

  def musician
    campaign.musician
  end

  def send_notification_to(musician)
    UserMailer.campaign_created(musician, campaign_name).delay.deliver
  end
end
