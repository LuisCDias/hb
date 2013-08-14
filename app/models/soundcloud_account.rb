class SoundcloudAccount < ActiveRecord::Base
  belongs_to :musician

  def get_tracks_for_musician
    soundcloud_client_for_musician.get("/me/tracks")
  end

  private

  def soundcloud_client_for_musician
    Soundcloud.new(access_token: self.access_token)
  end
end
