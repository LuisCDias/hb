class Campaign < ActiveRecord::Base
  belongs_to :category
  belongs_to :musician
  has_many :backers, through: :reservations, source: :user
  has_many :reservations, dependent: :destroy
  has_one :local_track, dependent: :destroy

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

  def musician_access_token
    musician.access_token
  end

  def artwork_for_track
    local_track.artwork_url
  end

  def track_permalink
    local_track.permalink_url
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

  def reserved
    reservations.length
  end

  def playcount
   self.track_info.playback_count
  end

  def downloadcount
    self.track_info.download_count
  end

  def self.search(search)
    if search
      where(category_id: search)
    else
      all
    end
  end
end
