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
      notify_backers
      UserMailer.campaign_successful_musician(self.campaign.musician.user, self.campaign).deliver
    end
  end

  private

  def notify_backers
    SuccessfulCampaignBackersNotification.new(self.campaign).deliver
  end
end
