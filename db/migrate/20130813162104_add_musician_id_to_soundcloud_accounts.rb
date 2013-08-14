class AddMusicianIdToSoundcloudAccounts < ActiveRecord::Migration
  def change
    add_reference :soundcloud_accounts, :musician, index: true
  end
end
