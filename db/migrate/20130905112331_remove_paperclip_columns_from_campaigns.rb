class RemovePaperclipColumnsFromCampaigns < ActiveRecord::Migration
  def change
    remove_column :campaigns, :full_track_file_name
    remove_column :campaigns, :full_track_content_type
    remove_column :campaigns, :full_track_file_size
    remove_column :campaigns, :full_track_updated_at
  end
end
