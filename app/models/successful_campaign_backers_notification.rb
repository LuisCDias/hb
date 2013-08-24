class SuccessfulCampaignBackersNotification
  def initialize(campaign)
    @campaign = campaign
  end

  def deliver
    backers.each { |backer| notify backer }
  end

  private

  attr_reader :campaign

  def backers
    campaign.backers.map(&:email)
  end

  def notify(backer)
    UserMailer.campaign_successful_fan(backer, campaign).deliver
  end
end
