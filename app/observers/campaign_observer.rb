class CampaignObserver < ActiveRecord::Observer
  observe :campaign

  def after_create(campaign)
    send_campaign_created_notification campaign
    create_local_track_for campaign
  end

  private

  def send_campaign_created_notification(campaign)
    CampaignCreatedNotification.new campaign
  end

  def update_campaign_track_soundcloud_metadata(campaign)
    SoundcloudGateway::TrackMetadataUpdater.new(campaign).
      update_track_metadata
  end
end
