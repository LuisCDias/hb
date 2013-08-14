class AddAttachmentFullTrackToCampaigns < ActiveRecord::Migration
  def self.up
    change_table :campaigns do |t|
      t.attachment :full_track
    end
  end

  def self.down
    drop_attached_file :campaigns, :full_track
  end
end
