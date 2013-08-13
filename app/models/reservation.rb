class Reservation < ActiveRecord::Base
  belongs_to :campaign
  belongs_to :user

  def self.reserve_campaign_for(user, campaign)
    create(
      user: user,
      campaign: campaign
    )
  end
end
