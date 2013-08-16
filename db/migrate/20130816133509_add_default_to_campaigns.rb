class AddDefaultToCampaigns < ActiveRecord::Migration
  def change
    change_column :campaigns, :requested_likes, :integer, default: 1
  end
end
