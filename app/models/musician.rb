class Musician < ActiveRecord::Base
  belongs_to :user
  has_many :campaigns, dependent: :destroy
  has_one :soundcloud_account, dependent: :destroy

  def description
    musician_info.description
  end

  def soundcloud_followers_count
    musician_info.followers_count
  end

  def total_campaign_playcount
    total_playcounts
  end

  def total_launch_requests_achieved
    total_launch_requests
  end

  def soundcloud_page
    musician_info.permalink_url
  end

  def tracks
    musician_info.get_tracks_for_musician
  end

  private

  def playcount_for_musician_campaigns
    campaigns.map(&:playcount)
  end

  def total_playcounts
    playcount_for_musician_campaigns.inject(&:+)
  end

  def launch_requests_for_musician_campaigns
    if has_campaigns?
      campaigns.map(&:reservations_count)
    else
      0
    end
  end

  def has_campaigns?
    true if campaigns != nil
  end

  def total_launch_requests
    launch_requests_for_musician_campaigns.inject(&:+)
  end

  def musician_info
    SoundcloudGateway::SoundcloudMusicianInfo.new(
      soundcloud_account.access_token
    ).get_soundcloud_info
  end
end
