class SoundcloudAccount < ActiveRecord::Base
  belongs_to :musician

  def sync_with_soundcloud
    update_attributes(
      soundcloud_avatar: soundcloud_info.avatar_url,
      soundcloud_uid: soundcloud_info.id,
      soundcloud_username: soundcloud_info.username,
      soundcloud_profile: soundcloud_info.permalink_url
    )
  end

  private

  def soundcloud_info
    SoundcloudGateway::SoundcloudMusicianInfo.new(access_token).
      get_soundcloud_info
  end
end
