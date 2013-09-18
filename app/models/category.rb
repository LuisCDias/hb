class Category < ActiveRecord::Base
  has_many :campaigns
  has_many :user_tracks
  has_many :advice_requests

  validates :name, presence: true
  validates :name, uniqueness: true
end
