class CampaignObserver < ActiveRecord::Observer
  observe :campaign

  def after_create(campaign)
    run_created_campaign_policy_for campaign
  end

  private

  def run_created_campaign_policy_for(campaign)
    CampaignCreatedPolicy.new(campaign).process
  end
end
