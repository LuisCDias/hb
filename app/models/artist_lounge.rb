class ArtistLounge
  def initialize(artist)
    @artist = artist
  end

  def campaigns
    @artist.campaigns
  end

  def campaign_count
    campaigns.count
  end

  def soundcloud_avatar
    @artist.soundcloud_account.soundcloud_avatar
  end

  def soundcloud_followers
    @artist.soundcloud_followers_count
  end

  def musician_description
    @artist.description
  end

  def download_counts
    campaigns.sum { |c| c.download_count }
  end
end
