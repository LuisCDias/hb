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
        client_id: ENV['SC_LOCAL_ID'],
        client_secret: ENV['SC_LOCAL_SECRET'],
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
end
