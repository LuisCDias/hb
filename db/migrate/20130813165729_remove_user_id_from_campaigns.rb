class RemoveUserIdFromCampaigns < ActiveRecord::Migration
  def change
    remove_column :campaigns, :user_id
  end
end
