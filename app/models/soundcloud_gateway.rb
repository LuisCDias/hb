module SoundcloudGateway
  class SoundcloudClient
    def initialize(redirect_uri)
      @redirect_uri = redirect_uri
    end

    def client
      soundcloud_client
    end

    private

    attr_reader :redirect_uri

    def soundcloud_client
      Soundcloud.new(
        client_id: ENV['SC_CLIENT_ID'],
        client_secret: ENV['SC_CLIENT_SECRET'],
        redirect_uri: redirect_uri
      )
    end
  end

  class SoundcloudMusicianInfo
    def initialize(access_token)
      @access_token = access_token
    end

    def get_soundcloud_info
      soundcloud_client.get("/me")
    end

    def get_tracks_for_musician
      soundcloud_client.get("/me/tracks")
    end

    private

    attr_reader :access_token

    def soundcloud_client
      Soundcloud.new access_token: access_token
    end
  end

  class SoundcloudTrackInfo
    attr_reader :track_id

    def initialize(track_id)
      @track_id = track_id
    end

    def get_soundcloud_track_info
      soundcloud_client.get("/tracks/#{track_id}")
    end

    private

    def soundcloud_client
      Soundcloud.new client_id: ENV['SC_CLIENT_ID']
    end
  end

  class TrackMetadataUpdater
    attr_reader :campaign_id

    def initialize(campaign)
      @access_token = campaign.musician_access_token
      @campaign_id = campaign.id
      @track_id = campaign.track_id
    end

    def update_track_metadata
      soundcloud_client.put(
        track.uri, track: {
        sharing: 'public',
        embedabble_by: 'all',
        downloadable: false,
        description:
        "Help launch this track at http://www.headblendr.com/campaigns/#{campaign_id}"
      })
    end

    def set_track_as_downloadable
      soundcloud_client.put(
        track.uri, track: {
        downloadable: true,
        description: "Track launched at http://www.headblendr.com"
      })
    end

    private

    attr_reader :access_token, :track_id

    def soundcloud_client
      Soundcloud.new access_token: access_token
    end

    def track
      soundcloud_client.get("/tracks/#{track_id}")
    end
  end
end
