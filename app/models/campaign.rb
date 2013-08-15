class Campaign < ActiveRecord::Base

  belongs_to :category
  belongs_to :musician
  has_many :backers, through: :reservations, source: :user
  has_many :reservations

  def save
    super
    update_campaign_track_metadata
  end

  def is_available_for?(user)
    true unless backers.include? user
  end

  def reservations_left
    requested_likes.to_i - reserved
  end

  def artwork_for_track
    track_info.artwork_url.sub("large", "t200x200")
  end

  def track_permalink
    track_info.permalink_url
  end

  def playcount
    track_info.playback_count
  end

  def successful?
    true if reservations_left <= requested_likes
  end

  def progress
    if reserved == 0
      0
    else
      (100 * reserved / requested_likes).round
    end
  end

  def reserved
    reservations.length
  end

  def track_info
    client = Soundcloud.new(client_id: ENV['SC_CLIENT_ID'])
    client.get("/tracks/#{track_id}")
  end

  def update_campaign_track_metadata
    client = Soundcloud.new(access_token: musician.soundcloud_account.access_token)
    track = client.get("/tracks/#{self.track_id}")
    client.put(track.uri, track: {
      sharing: 'public',
      embedabble_by: 'all',
      downloadable: false,
      description: "Help launch this track at http://www.headblendr.com/campaigns/#{id}"
    })
  end
end
