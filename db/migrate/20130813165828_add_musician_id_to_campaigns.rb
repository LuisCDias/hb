class AddMusicianIdToCampaigns < ActiveRecord::Migration
  def change
    add_reference :campaigns, :musician, index: true
  end
end
