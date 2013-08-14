class ChangeUserIdForSoundcloudAccounts < ActiveRecord::Migration
  def change
    remove_column :soundcloud_accounts, :user_id
  end
end
