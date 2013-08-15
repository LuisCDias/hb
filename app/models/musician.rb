class Musician < ActiveRecord::Base
  belongs_to :user
  has_many :campaigns
  has_one :soundcloud_account

  def description
    musician_info.description
  end

  def soundcloud_followers_count
    musician_info.followers_count
  end

  def successful_campaigns
    successful_campaigns = []
    campaigns.collect do |campaign|
      successful_campaigns << campaign.successful?
    end
    successful_campaigns.length
  end

  def total_campaign_playcount
    campaigns.inject(0) do |sum, campaign|
      sum + campaign.playcount
    end
  end

  def total_launch_requests_achieved
    campaigns.inject(0) do |sum, campaign|
      sum + campaign.reservations.length
    end
  end

  private

  def musician_info
    musician_client.get("/me")
  end

  def musician_client
    Soundcloud.new access_token: soundcloud_account.access_token
  end
end
