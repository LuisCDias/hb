class AddTrackIdToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :track_id, :integer
  end
end
