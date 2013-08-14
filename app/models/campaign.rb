class Campaign < ActiveRecord::Base
  belongs_to :category
  belongs_to :musician
  has_many :backers, through: :reservations, source: :user
  has_many :reservations

  has_attached_file :full_track,
    storage: :s3,
    s3_credentials: S3_CREDENTIALS

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

  def reserved
    reservations.length
  end

  def track_info
    client = Soundcloud.new(client_id: ENV['SC_CLIENT_ID'])
    client.get("/tracks/#{track_id}")
  end
end
