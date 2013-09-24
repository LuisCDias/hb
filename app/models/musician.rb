class Musician < ActiveRecord::Base
  belongs_to :user
  has_many :campaigns, dependent: :destroy
  has_one :soundcloud_account, dependent: :destroy

  delegate :access_token, to: :soundcloud_account
  delegate :soundcloud_username, to: :soundcloud_account
  delegate :soundcloud_avatar, to: :soundcloud_account
  delegate :soundcloud_profile, to: :soundcloud_account
  delegate :email, to: :user
  delegate :name, to: :user

  def campaign_count
    campaigns.count
  end

  def description
    musician_info.description
  end

  def soundcloud_followers_count
    musician_info.followers_count
  end

  def total_campaign_download_count
    total_download_count
  end

  def total_campaign_playcount
    total_playcounts
  end

  def total_launch_requests_achieved
    total_launch_requests
  end

  def tracks
    tracks_for_musician
  end

  private

  def download_count_for_musician_campaigns
    campaigns.map(&:download_count)
  end

  def total_download_count
    download_count_for_musician_campaigns.inject(&:+)
  end

  def playcount_for_musician_campaigns
    campaigns.map(&:playcount)
  end

  def total_playcounts
    playcount_for_musician_campaigns.inject(&:+)
  end

  def total_launch_requests
    launch_requests_for_musician_campaigns.inject(&:+)
  end

  def launch_requests_for_musician_campaigns
    campaigns.map(&:reserved)
  end

  def musician_info
    SoundcloudGateway::SoundcloudMusicianInfo.new(
      soundcloud_account.access_token
    ).get_soundcloud_info
  end

  def tracks_for_musician
    SoundcloudGateway::SoundcloudMusicianInfo.new(
      soundcloud_account.access_token
    ).get_tracks_for_musician
  end
end
