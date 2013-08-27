class LocalTrack < ActiveRecord::Base
  belongs_to :campaign

  def self.update_from_soundcloud_info(track_info)
    update_attributes(
      soundcloud_id: campaign.track_id,
      permalink_url: track_info.track_permalink,
      download_url: track_info.download_url,
      artwork_url: track_info.track_artwork,
    )
  end
end
