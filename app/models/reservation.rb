class Reservation < ActiveRecord::Base
  belongs_to :campaign
  belongs_to :user
  after_create :campaign_successful

  def self.reserve_campaign_for(user, campaign)
    create(user: user, campaign: campaign)
  end

  def campaign_successful
    if campaign.successful?
      campaign.set_track_as_downloadable
      notify_backers_and_musician
    end
  end

  private

  def notify_backers_and_musician
    notify_backers
    notify_musician
  end

  def notify_backers
    SuccessfulCampaignBackersNotification.new(campaign).deliver
  end

  def notify_musician
    SuccessfulCampaignMusicianNotification.new(campaign).deliver
  end
end
