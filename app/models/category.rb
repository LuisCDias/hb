class Category < ActiveRecord::Base
  has_many :campaigns
  has_many :user_tracks

  validates :name, presence: true
  validates :name, uniqueness: true
end
