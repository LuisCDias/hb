class Campaign < ActiveRecord::Base
  belongs_to :category
  belongs_to :musician
  has_many :backers, through: :reservations, source: :user
  has_many :reservations
  after_create :newcampaignmail

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
    (100 * reserved / requested_likes.to_i).round
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

  def track_info
    begin
     client = Soundcloud.new(client_id: ENV['SC_LOCAL_ID'])
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
      where('category_id LIKE :search', :search => "%#{search}%")
    else
      scoped
    end
  end
end
