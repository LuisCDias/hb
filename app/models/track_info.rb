class TrackInfo
  def initialize(track_id)
    @track_id = track_id
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

  attr_reader :track_id

  def resized_artwork
    if track_info.artwork_url?
      track_info.artwork_url.sub("large", "t500x500")
    else
      default_artwork_url.sub("large", "t500x500")
    end
  end

  def track_info
    SoundcloudGateway::SoundcloudTrackInfo.new(track_id).
      get_soundcloud_track_info
  end

  def default_artwork_url
    "https://i1.sndcdn.com/artworks-000055452316-se7lpm-large.jpg?aa1a7cb"
  end
end
