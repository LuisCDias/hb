class RemoveTrackIdFromCampaigns < ActiveRecord::Migration
  def change
    remove_column :campaigns, :local_track_id
  end
end
