class LocalTrackFactory
  def initialize(campaign)
    @campaign = campaign
    @track_id = campaign.track_id
  end

  def create_local_track
    get_track_info
    save_local_track
  end

  private

  attr_reader :campaign, :track_id

  def save_local_track
    LocalTrack.create_from_soundcloud_info campaign, track_info
  end

  def track_info
    get_track_info
  end

  def get_track_info
    TrackInfo.new track_id
  end
end
