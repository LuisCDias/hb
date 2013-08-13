class Category < ActiveRecord::Base
  has_many :campaigns

  validates :name, presence: true
  validates :name, uniqueness: true
end
