class UserTrack < ActiveRecord::Base
	belongs_to :upload
	belongs_to :category
end
