class Reservation < ActiveRecord::Base
  belongs_to :campaign
  belongs_to :user
  after_create :campaign_successful

  def self.reserve_campaign_for(user, campaign)
    create(
      user: user,
      campaign: campaign
    )
  end

  def campaign_successful
  	if self.campaign.successful?
       campaign.set_track_as_downloadable
  		 UserMailer.campaign_successful_fan(self.user, self.campaign).deliver
  		 UserMailer.campaign_successful_musician(self.campaign.musician.user, self.campaign).deliver
  end
end
end