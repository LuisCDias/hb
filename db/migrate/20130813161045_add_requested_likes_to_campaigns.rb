class AddRequestedLikesToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :requested_likes, :integer
  end
end
