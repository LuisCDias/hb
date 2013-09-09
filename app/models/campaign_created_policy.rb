class CampaignCreatedPolicy
  def initialize(campaign)
    @campaign = campaign
  end

  def process
    update_campaign_track_soundcloud_metadata
    send_campaign_created_notification
  end

  private

  attr_reader :campaign

  def send_campaign_created_notification(campaign)
    CampaignCreatedNotification.delay.new(campaign)
  end

  def update_campaign_track_soundcloud_metadata(campaign)
    SoundcloudGateway::TrackMetadataUpdater.new(campaign).
      update_track_metadata
  end
end
