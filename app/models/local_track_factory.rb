class LocalTrackFactory
  def initialize(campaign)
    @campaign = campaign
    @track_id = campaign.track_id
    @access_token = campaign.musician_access_token
  end

  def create
    create_local_track_for_campaign
  end

  private

  attr_reader :access_token, :campaign, :track_id

  def create_local_track_for_campaign
    campaign.build_local_track(
     soundcloud_id: track_id,
     permalink_url: track_info.track_permalink,
     artwork_url: track_info.track_artwork
    ).save
  end

  def track_info
    get_track_info
  end

  def get_track_info
    TrackInfo.new(access_token, track_id)
  end
end
