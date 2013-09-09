class CampaignCreatedPolicy
  def initialize(campaign)
    @campaign = campaign
  end

  def process
    create_local_track_for_campaign
    update_campaign_track_soundcloud_metadata
    send_campaign_created_notification
  end

  private

  attr_reader :campaign

  def create_local_track_for_campaign
    LocalTrackFactory.new(campaign).create
  end

  def send_campaign_created_notification
    CampaignCreatedNotification.delay.new(campaign)
  end

  def update_campaign_track_soundcloud_metadata
    SoundcloudGateway::TrackMetadataUpdater.new(campaign).
      update_track_metadata
  end
end
