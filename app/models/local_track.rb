class LocalTrack < ActiveRecord::Base
  belongs_to :campaign

  def update_from_soundcloud_info(track_info)
    update_attributes(
      soundcloud_id: campaign.track_id,
      permalink_url: track_info.permalink_url,
      download_url: track_info.download_url,
      artwork_url: track_info.artwork_url
    )
  end
end
