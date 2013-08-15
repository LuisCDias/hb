class Campaign < ActiveRecord::Base
  include Rails.application.routes.url_helpers

  belongs_to :category
  belongs_to :musician
  has_many :backers, through: :reservations, source: :user
  has_many :reservations

  def base_uri
    campaign_path(self)
  end

  has_attached_file :full_track,
    storage: :s3,
    s3_credentials: S3_CREDENTIALS

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

  def progress
  end

  def reserved
    reservations.length
  end

  def track_info
    client = Soundcloud.new(client_id: ENV['SC_LOCAL_ID'])
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
