class SuccessfulCampaignPolicy
  def initialize(campaign)
    @campaign = campaign
  end

  def process
    set_campaign_track_as_downloadable
    notify_backers
    notify_musician
  end

  private

  attr_reader :campaign

  def set_campaign_track_as_downloadable
    SoundcloudGateway::TrackMetadataUpdater.new(campaign).
      set_track_as_downloadable
  end

  def notify_backers
    SuccessfulCampaignBackersNotification.new(campaign).delay.deliver
  end

  def notify_musician
    SuccessfulCampaignMusicianNotification.new(campaign).delay.deliver
  end
end
