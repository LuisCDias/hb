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
    track_client = Soundcloud.new(
      access_token: campaign.musician.soundcloud_account.access_token
    )
    track = track_client.get("/tracks/#{campaign.track_id}")
    track_client.put(track.uri, track: {
      downloadable: true,
      description: "Track launched at http://www.headblendr.com"
    })
  end

  def notify_backers
    SuccessfulCampaignBackersNotification.new(campaign).deliver
  end

  def notify_musician
    SuccessfulCampaignMusicianNotification.new(campaign).deliver
  end
end
