class InvalidCampaignPolicy
  def initialize(campaign)
    @campaign = campaign
  end

  def sweep
    notify_musician
    sweep_campaign
  end

  private

  attr_reader :campaign

  def musician_email
    campaign.musician.email
  end

  def notify_musician
    UserMailer.delay.campaign_deleted(musician_email, campaign)
  end

  def sweep_campaign
    campaign.destroy
  end
end
