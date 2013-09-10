class SuccessfulCampaignPolicy
  def initialize(campaign)
    @campaign = campaign
  end

  def process
    notify_musician
    notify_backers
    set_campaign_track_as_downloadable
  end

  private

  attr_reader :campaign

  def notify_musician
    SuccessfulCampaignMusicianNotification.new(campaign).deliver
  end

  def notify_backers
    SuccessfulCampaignBackersNotification.new(campaign).deliver
  end

  def set_campaign_track_as_downloadable
    SoundcloudGateway::TrackMetadataUpdater.new(campaign).
      set_track_as_downloadable
  end
end
