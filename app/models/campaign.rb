class Campaign < ActiveRecord::Base
  belongs_to :category
  belongs_to :musician
  has_many :backers, through: :reservations, source: :user
  has_many :reservations, dependent: :destroy
  has_one :local_track
  after_create :newcampaignmail, :update_campaign_track_metadata,
    :set_local_track

  validates :musician_name, presence: true
  validates :name, presence: true
  validates_numericality_of :requested_likes, only_integer: true
  validates_numericality_of :requested_likes,
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 25,
    message: 'are limited to 25'
  validates :requested_likes, presence: true

  def is_available_for?(user)
    true unless backers.include? user
  end

  def reservations_left
    requested_likes.to_i - reserved
  end

  def artwork_for_track
    begin
     track_info.artwork_url.sub("large", "t200x200")
    rescue Exception
      artwork_url = 'https://i1.sndcdn.com/artworks-000055452316-se7lpm-large.jpg?aa1a7cb'
      artwork_url.sub("large", "t200x200")
    end
  end

  def track_permalink
    begin
      track_info.permalink_url
    rescue Exception
      permalink_url = 'http://soundcloud.com/headblendr/headblendr-official-song'
    end
  end

  def progress
    if reserved == 0
      0
    else
      (100 * reserved / requested_likes.to_i).round
    end
  end

  def successful?
    if reservations_left == 0
      true
    else
      false
    end
  end

  def set_track_as_downloadable
    track_client = Soundcloud.new(access_token: musician.soundcloud_account.access_token)
    track = track_client.get("/tracks/#{self.track_id}")
    track_client.put(track.uri, track: {
      downloadable: true,
      description: "Track launched at http://www.headblendr.com"
    })
  end

  def reserved
    reservations.length
  end

  def reservation_count
    reservations.count
  end

  def track_info
    begin
     client = Soundcloud.new(client_id: ENV['SC_STAGING_ID'])
     client.get("/tracks/#{track_id}")
    rescue Exception
      client.get("/tracks/105638518")
    end
  end

  def playcount
    self.track_info.playback_count
  end

  def downloadcount
    self.track_info.download_count
  end

  def update_campaign_track_metadata
    track_client = Soundcloud.new(access_token: musician.soundcloud_account.access_token)
    track = track_client.get("/tracks/#{self.track_id}")
    track_client.put(track.uri, track: {
      sharing: 'public',
      embedabble_by: 'all',
      downloadable: false,
      description: "Help launch this track at http://www.headblendr.com/campaigns/#{id}"
    })
  end

  def newcampaignmail
    UserMailer.campaign_created(self.musician.user, self).deliver
  end

  def self.search(search)
    if search
      where(category_id: search)
    else
      all
    end
  end

  def set_local_track
    self.build_local_track(
     soundcloud_id: track_id,
     permalink_url: track_permalink,
     artwork_url: artwork_for_track
    ).save
  end
end
