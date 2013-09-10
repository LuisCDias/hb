class SuccessfulCampaignBackersNotification
  def initialize(campaign)
    @campaign = campaign
  end

  def deliver
    backers.each { |backer| send_notification_to backer }
  end

  private

  attr_reader :campaign

  def backers
    campaign.backers
  end

  def send_notification_to(backer)
    UserMailer.delay.
      successful_campaign_notification_for_backer(backer, campaign)
  end
end
