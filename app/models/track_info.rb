class TrackInfo
  attr_reader :access_token, :track_id

  def initialize(access_token, track_id)
    @access_token = access_token
    @track = track_id
  end

  def track_artwork
    resized_artwork
  end

  def track_permalink
    track_info.permalink_url
  end

  def track_playback_count
    track_info.playback_count
  end

  def track_download_count
    track_info.download_count
  end

  private

  def resized_artwork
    track_info.artwork_url.sub("large", "t200x200")
  end

  def track_info
    SoundcloudGateway::SoundcloudTrackInfo.new(access_token, track_id).
      get_soundcloud_track_info
  end
end
