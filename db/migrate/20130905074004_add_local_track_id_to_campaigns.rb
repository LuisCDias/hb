class AddLocalTrackIdToCampaigns < ActiveRecord::Migration
  def change
    add_reference :campaigns, :local_track, index: true
  end
end
