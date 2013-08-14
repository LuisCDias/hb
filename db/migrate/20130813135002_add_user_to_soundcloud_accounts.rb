class AddUserToSoundcloudAccounts < ActiveRecord::Migration
  def change
    add_reference :soundcloud_accounts, :user, index: true
  end
end
