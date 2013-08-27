class CampaignObserver < ActiveRecord::Observer
  observe :campaign

  def after_create(campaign)
    send_campaign_created_notification campaign
  end

  private

  def send_campaign_created_notification(campaign)
    CampaignCreatedNotification.new campaign
  end
end
