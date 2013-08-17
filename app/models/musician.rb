class Musician < ActiveRecord::Base
  belongs_to :user
  has_many :campaigns, dependent: :destroy
  has_one :soundcloud_account, dependent: :destroy

  validates_associated :campaign

  def description
    musician_info.description
  end

  def soundcloud_followers_count
    musician_info.followers_count
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

  def soundcloud_page
    musician_info.permalink_url
  end

  private

  def musician_info
    begin
      musician_client.get("/me")
    rescue Exception
      musician_client.get("/users/54577589")
    end
  end

  def musician_client
    Soundcloud.new(access_token: soundcloud_account.access_token)
  end
end
