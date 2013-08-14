class AddMusicianNameToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :musician_name, :string
  end
end
