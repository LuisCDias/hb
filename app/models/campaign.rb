class Campaign < ActiveRecord::Base
  has_many :backers, through: :reservations, source: :user
  has_many :reservations

  def is_available_for?(user)
    true unless backers.include? user
  end
end
